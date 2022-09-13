class Api::V1::PicturesController < ApplicationController
  def index
    # render json: { status: 'SUCCESS', message: 'Loaded posts', data: }
    render json:
      {
        status: 'SUCCESS',
        message: 'Loaded posts',
        data: [
          "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAlgAAAFSAQMAAAAU2zNkAAAABlBMVEUdofL///97ueaSAAADU0lEQVR42u3WvY3cMBCG4REYKGTqTKXQJbkAA2QHbkmlsASGAkxzjDvfgqcTFYzmw+76bt5skwcLavhDlmVZlmVZlmVZlmVZlmV9lTwXFDUxcwJZCzNvICsyc8NQjl9a6aWsXvmXyiu7Kq3watVXdtUv123BllU/Efw2FeLRSIelvy2+k1rTelj62+J7JqGVj5PK/6Y1Si1XRp+RuZLjprTim9VoEVvzh63Ht4i5Sq06HAnmX3LLt8FI9PUXdPjw83uriK20+6mxFl73P9+VxVb+MF69VWyVUyuJrW03qhor7KeI30diq51ZjaYktHg/9r1Ks9hKJ9ZGgaRWPtlCZWLxVVFOrNU3sbWdbMcUq9iqJ5ZnudXGW/sP8ya2OO2tXpFb6/6Y6GW5lc+sVW5tZ1aSW7VPrtpqZxbJLU5jq12x1rFVr1hleKzydsWqY6tcsdrYylcsTkNrvfRszkMrXbK2kdUUz/mPVr1m8eh63MTWbpkVI9FPhjKw8kWrDax00eKkfk70Ez4DrQq0OOmtuU8Azmp6y+1OhQiyqtqadscVzGpai7i3AS3eFNbxWNZZ4UmtBWj5J7VmoOXOqCamvk846wfhrJ8UYVakgLPygrPajLP4N9DiO1jVrEHhv7O2h1rLF7D8qVU+jTXfxcpiyz2pNZ1a60MtQlrxHlaSWwFoLfewSJ4HWjPQcuqnSW8CWoS0ovra7gWgtaivtJ4HWg5oTfprqBeBVlBfHT0PtJz+iO4hrUV9rPYczPpGfmgB9yM9p9WAo1ofbs1Da3u45YZWebg1Da38cIugxxfwyIlAK4wswh2r7QksP97asA25XbQc0Jr027Gn30K9CLTCaDviBiwRbijoag5oTaMtBPuQ9bq1DMYetviFcAuWSbFgQMvrx743GHvUuJKqw6iivmRVWfNhVFEfsqisoB6vXsSN1wQcrxk4Xh44XgE4EowbCce4kViAJ07EjYRj3GdcGHdK4C40moEXB+MujgX0XprK8SHXgM/eCnyqlmd4qnrgU9Uhn4QMfMYF4NPLD5YLtWDtSQ4JCsCz3gOv7Gm0XJAtWQh3/yeCPS8rKQuHrwi5O0hd3K086I8RoNBXS1/fihiskGVZlmVZlmVZlmVZlmVZX6O/sJEUs8KFQ9sAAAAASUVORK5CYII=",
          "data:image/png;base64,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"
        ]
      }
  end

  def upload

  end
end
