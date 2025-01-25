# Ruby-SDL3 : SDL3 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl3-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro


  # Enum

  INIT_STATUS_UNINITIALIZED = 0
  INIT_STATUS_INITIALIZING = 1
  INIT_STATUS_INITIALIZED = 2
  INIT_STATUS_UNINITIALIZING = 3

  # Typedef

  typedef :int, :SDL_InitStatus

  # Struct

  class InitState < FFI::Struct
    layout(
      :status, AtomicInt,
      :thread, :ulong_long,
      :reserved, :pointer,
    )
  end


  # Function

  def self.setup_mutex_symbols(output_error = false)
    symbols = [
      :SDL_CreateMutex,
      :SDL_LockMutex,
      :SDL_TryLockMutex,
      :SDL_UnlockMutex,
      :SDL_DestroyMutex,
      :SDL_CreateRWLock,
      :SDL_LockRWLockForReading,
      :SDL_LockRWLockForWriting,
      :SDL_TryLockRWLockForReading,
      :SDL_TryLockRWLockForWriting,
      :SDL_UnlockRWLock,
      :SDL_DestroyRWLock,
      :SDL_CreateSemaphore,
      :SDL_DestroySemaphore,
      :SDL_WaitSemaphore,
      :SDL_TryWaitSemaphore,
      :SDL_WaitSemaphoreTimeout,
      :SDL_SignalSemaphore,
      :SDL_GetSemaphoreValue,
      :SDL_CreateCondition,
      :SDL_DestroyCondition,
      :SDL_SignalCondition,
      :SDL_BroadcastCondition,
      :SDL_WaitCondition,
      :SDL_WaitConditionTimeout,
      :SDL_ShouldInit,
      :SDL_ShouldQuit,
      :SDL_SetInitialized,
    ]
    apis = {
      :SDL_CreateMutex => :CreateMutex,
      :SDL_LockMutex => :LockMutex,
      :SDL_TryLockMutex => :TryLockMutex,
      :SDL_UnlockMutex => :UnlockMutex,
      :SDL_DestroyMutex => :DestroyMutex,
      :SDL_CreateRWLock => :CreateRWLock,
      :SDL_LockRWLockForReading => :LockRWLockForReading,
      :SDL_LockRWLockForWriting => :LockRWLockForWriting,
      :SDL_TryLockRWLockForReading => :TryLockRWLockForReading,
      :SDL_TryLockRWLockForWriting => :TryLockRWLockForWriting,
      :SDL_UnlockRWLock => :UnlockRWLock,
      :SDL_DestroyRWLock => :DestroyRWLock,
      :SDL_CreateSemaphore => :CreateSemaphore,
      :SDL_DestroySemaphore => :DestroySemaphore,
      :SDL_WaitSemaphore => :WaitSemaphore,
      :SDL_TryWaitSemaphore => :TryWaitSemaphore,
      :SDL_WaitSemaphoreTimeout => :WaitSemaphoreTimeout,
      :SDL_SignalSemaphore => :SignalSemaphore,
      :SDL_GetSemaphoreValue => :GetSemaphoreValue,
      :SDL_CreateCondition => :CreateCondition,
      :SDL_DestroyCondition => :DestroyCondition,
      :SDL_SignalCondition => :SignalCondition,
      :SDL_BroadcastCondition => :BroadcastCondition,
      :SDL_WaitCondition => :WaitCondition,
      :SDL_WaitConditionTimeout => :WaitConditionTimeout,
      :SDL_ShouldInit => :ShouldInit,
      :SDL_ShouldQuit => :ShouldQuit,
      :SDL_SetInitialized => :SetInitialized,
    }
    args = {
      :SDL_CreateMutex => [],
      :SDL_LockMutex => [:pointer],
      :SDL_TryLockMutex => [:pointer],
      :SDL_UnlockMutex => [:pointer],
      :SDL_DestroyMutex => [:pointer],
      :SDL_CreateRWLock => [],
      :SDL_LockRWLockForReading => [:pointer],
      :SDL_LockRWLockForWriting => [:pointer],
      :SDL_TryLockRWLockForReading => [:pointer],
      :SDL_TryLockRWLockForWriting => [:pointer],
      :SDL_UnlockRWLock => [:pointer],
      :SDL_DestroyRWLock => [:pointer],
      :SDL_CreateSemaphore => [:uint],
      :SDL_DestroySemaphore => [:pointer],
      :SDL_WaitSemaphore => [:pointer],
      :SDL_TryWaitSemaphore => [:pointer],
      :SDL_WaitSemaphoreTimeout => [:pointer, :int],
      :SDL_SignalSemaphore => [:pointer],
      :SDL_GetSemaphoreValue => [:pointer],
      :SDL_CreateCondition => [],
      :SDL_DestroyCondition => [:pointer],
      :SDL_SignalCondition => [:pointer],
      :SDL_BroadcastCondition => [:pointer],
      :SDL_WaitCondition => [:pointer, :pointer],
      :SDL_WaitConditionTimeout => [:pointer, :pointer, :int],
      :SDL_ShouldInit => [:pointer],
      :SDL_ShouldQuit => [:pointer],
      :SDL_SetInitialized => [:pointer, :bool],
    }
    retvals = {
      :SDL_CreateMutex => :pointer,
      :SDL_LockMutex => :void,
      :SDL_TryLockMutex => :bool,
      :SDL_UnlockMutex => :void,
      :SDL_DestroyMutex => :void,
      :SDL_CreateRWLock => :pointer,
      :SDL_LockRWLockForReading => :void,
      :SDL_LockRWLockForWriting => :void,
      :SDL_TryLockRWLockForReading => :bool,
      :SDL_TryLockRWLockForWriting => :bool,
      :SDL_UnlockRWLock => :void,
      :SDL_DestroyRWLock => :void,
      :SDL_CreateSemaphore => :pointer,
      :SDL_DestroySemaphore => :void,
      :SDL_WaitSemaphore => :void,
      :SDL_TryWaitSemaphore => :bool,
      :SDL_WaitSemaphoreTimeout => :bool,
      :SDL_SignalSemaphore => :void,
      :SDL_GetSemaphoreValue => :uint,
      :SDL_CreateCondition => :pointer,
      :SDL_DestroyCondition => :void,
      :SDL_SignalCondition => :void,
      :SDL_BroadcastCondition => :void,
      :SDL_WaitCondition => :void,
      :SDL_WaitConditionTimeout => :bool,
      :SDL_ShouldInit => :bool,
      :SDL_ShouldQuit => :bool,
      :SDL_SetInitialized => :void,
    }
    symbols.each do |sym|
      begin
        attach_function apis[sym], sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).") if output_error
      end
    end
  end

end

