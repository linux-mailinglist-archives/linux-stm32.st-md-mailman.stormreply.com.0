Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28094934E1D
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jul 2024 15:25:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E56F7C78018;
	Thu, 18 Jul 2024 13:25:42 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9AE1C78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jul 2024 13:25:41 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-5d437791affso406625eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jul 2024 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721309140; x=1721913940;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6u33BE/Zx9BQXUadkdADDVxjMkkZVQKQkWWACwS8Fdk=;
 b=Jk36HtRiQdMEmLY9rL4mFCv+61Sc5HY6d/ksPJ/CwpCClun8rmfp9OyaWTLbKfMy1K
 mXKtBimfyeEMfqI03RTKj9H2w+eFMuq2orclKdRz1Mq/2O/Jb+QcORzM/4qALFO0KSiV
 yKSazg87LIxuVDTswcwyXY00lJNe1Id5EwerKdha7L0yC1oCy7/53Vynqiyqv3iiVocK
 DYtMrCvBwKZYWPCRxI8VKrwTHndD0242GBALSUPrJNeFlyfqFOFV2udgZJsY9ocd6kSo
 +OBpf9kRC8xR5Ignl7NZAsiyWTGQu6ErjG33kWI+0ihADDkdaZeDQDBnWlOtBbDtFoqE
 hY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721309140; x=1721913940;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6u33BE/Zx9BQXUadkdADDVxjMkkZVQKQkWWACwS8Fdk=;
 b=cM+apkKFNyEv3IdrEF7eygpM1/Gbu0Hpcm9KX3zstDQqMZ5pW73EhIuHNyc9CMoc3/
 jsPy9x0NzoId2BA5kNJDzobYISkGtFS1JMHk4BZf9uN4p18FBRRkBBQiL3cQ8taJH85Z
 GkzPKo9qPfYpy2xYiDcgIa30mfJEWmL3uZd5mbeFJr8YWMzMlgB2Gn5OBRSMyeiteMir
 jzXZgEvrZFMDAlTDx9Wzy03z9unfR9CEXI6Vep0nVbFhTMObOLvnSW/2kKJmutlDFVHL
 eFkc6o5YgSJDJOyUkxZvPyPcIFvHTvIrcqlQwsML+3V+txfHOk09lNIDyg7mLyaB+UMv
 YPrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIkXPFxFYzgnlZkLo0k53G7YlMpGxIufGohtkXKYIS0b8t7HZdcQ6WA/478c/Z01N0FI46gpaz9NI67++IwTsVUo+UfjM/oNwcjXhesl6x5tSi84xuy9RP
X-Gm-Message-State: AOJu0YypLlk+nKpyW+5fVSwPDYyQrQDVh4Yp9G/xRVjGAn36LMlaGYF7
 xGA5I+GGbPy4BBTe3U4WaVE2suwE0JZGv3/6/pPqxJbNYFNIIQFNZlGP5iRiVvqyCBfG0eIKHQV
 /i9FCNkM24MtSl8nX7QSxspP9ez6hDAu+/RjGug==
X-Google-Smtp-Source: AGHT+IGKC/ZsbnFgt4JyjJAfnoT/3Lb+kggEiogigNqLWPbn73aOYqG3+3JwCEvetKDXFvcd02w9i8v9M948PkzRZ2g=
X-Received: by 2002:a05:6871:293:b0:254:a57e:1aed with SMTP id
 586e51a60fabf-260d907c717mr4383695fac.26.1721309140544; Thu, 18 Jul 2024
 06:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240712102029.3697965-1-james.clark@linaro.org>
 <20240712102029.3697965-9-james.clark@linaro.org>
In-Reply-To: <20240712102029.3697965-9-james.clark@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 18 Jul 2024 14:25:29 +0100
Message-ID: <CAJ9a7ViLNtH+tHgxDTRQGO3m+kF-t8v_HB_-JuGiFwnS9UJZEQ@mail.gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@arm.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, "Liang,
 Kan" <kan.liang@linux.intel.com>, suzuki.poulose@arm.com,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, anshuman.khandual@arm.com,
 coresight@lists.linaro.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 leo.yan@linux.dev, Jiri Olsa <jolsa@kernel.org>,
 gankulkarni@os.amperecomputing.com
Subject: Re: [Linux-stm32] [PATCH v5 08/17] perf: cs-etm: Add runtime
	version check for OpenCSD
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, 12 Jul 2024 at 11:22, James Clark <james.clark@linaro.org> wrote:
>
> From: James Clark <james.clark@arm.com>
>
> OpenCSD is dynamically linked so although there is a build time check,
> at runtime the user might still have the wrong version. To avoid hard
> to debug errors, add a runtime version check.
>
> Signed-off-by: James Clark <james.clark@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/build/feature/test-libopencsd.c               |  4 ++--
>  tools/perf/Makefile.config                          |  2 +-
>  tools/perf/util/cs-etm-decoder/cs-etm-decoder.c     | 13 +++++++++++++
>  tools/perf/util/cs-etm-decoder/cs-etm-decoder.h     |  1 +
>  tools/perf/util/cs-etm-decoder/cs-etm-min-version.h | 13 +++++++++++++
>  tools/perf/util/cs-etm.c                            |  3 +++
>  6 files changed, 33 insertions(+), 3 deletions(-)
>  create mode 100644 tools/perf/util/cs-etm-decoder/cs-etm-min-version.h
>
> diff --git a/tools/build/feature/test-libopencsd.c b/tools/build/feature/test-libopencsd.c
> index 4cfcef9da3e4..d092a0c662f4 100644
> --- a/tools/build/feature/test-libopencsd.c
> +++ b/tools/build/feature/test-libopencsd.c
> @@ -1,12 +1,12 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <opencsd/c_api/opencsd_c_api.h>
> +#include "cs-etm-decoder/cs-etm-min-version.h"
>
>  /*
>   * Check OpenCSD library version is sufficient to provide required features
>   */
> -#define OCSD_MIN_VER ((1 << 16) | (2 << 8) | (1))
>  #if !defined(OCSD_VER_NUM) || (OCSD_VER_NUM < OCSD_MIN_VER)
> -#error "OpenCSD >= 1.2.1 is required"
> +#error "OpenCSD minimum version (OCSD_MIN_VER) not met."
>  #endif
>
>  int main(void)
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index 7f1e016a9253..2d21be42820e 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -141,7 +141,7 @@ endif
>  ifdef CSLIBS
>    LIBOPENCSD_LDFLAGS := -L$(CSLIBS)
>  endif
> -FEATURE_CHECK_CFLAGS-libopencsd := $(LIBOPENCSD_CFLAGS)
> +FEATURE_CHECK_CFLAGS-libopencsd := $(LIBOPENCSD_CFLAGS) -I$(src-perf)/util
>  FEATURE_CHECK_LDFLAGS-libopencsd := $(LIBOPENCSD_LDFLAGS) $(OPENCSDLIBS)
>
>  # for linking with debug library, run like:
> diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> index b78ef0262135..5e1b4503aab1 100644
> --- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> +++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> @@ -16,6 +16,7 @@
>
>  #include "cs-etm.h"
>  #include "cs-etm-decoder.h"
> +#include "cs-etm-min-version.h"
>  #include "debug.h"
>  #include "intlist.h"
>
> @@ -835,3 +836,15 @@ const char *cs_etm_decoder__get_name(struct cs_etm_decoder *decoder)
>  {
>         return decoder->decoder_name;
>  }
> +
> +int cs_etm_decoder__check_ver(void)
> +{
> +       if (ocsd_get_version() < OCSD_MIN_VER) {
> +               pr_err("OpenCSD >= %d.%d.%d is required\n", OCSD_MIN_MAJOR,
> +                                                           OCSD_MIN_MINOR,
> +                                                           OCSD_MIN_PATCH);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
> index 12c782fa6db2..2ec426ee16dc 100644
> --- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
> +++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
> @@ -107,5 +107,6 @@ int cs_etm_decoder__get_packet(struct cs_etm_packet_queue *packet_queue,
>
>  int cs_etm_decoder__reset(struct cs_etm_decoder *decoder);
>  const char *cs_etm_decoder__get_name(struct cs_etm_decoder *decoder);
> +int cs_etm_decoder__check_ver(void);
>
>  #endif /* INCLUDE__CS_ETM_DECODER_H__ */
> diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-min-version.h b/tools/perf/util/cs-etm-decoder/cs-etm-min-version.h
> new file mode 100644
> index 000000000000..c69597e9d0af
> --- /dev/null
> +++ b/tools/perf/util/cs-etm-decoder/cs-etm-min-version.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef INCLUDE__CS_ETM_MIN_VERSION_H__
> +#define INCLUDE__CS_ETM_MIN_VERSION_H__
> +
> +#define OCSD_MIN_MAJOR 1
> +#define OCSD_MIN_MINOR 2
> +#define OCSD_MIN_PATCH 1
> +
> +#define OCSD_MIN_VER ((OCSD_MIN_MAJOR << 16) | \
> +                     (OCSD_MIN_MINOR << 8) |  \
> +                     (OCSD_MIN_PATCH))
> +
> +#endif /* INCLUDE__CS_ETM_MIN_VERSION_H__ */
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 49fadf46f42b..2385d5ed5ea5 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -3369,6 +3369,9 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>         u64 *ptr = NULL;
>         u64 **metadata = NULL;
>
> +       if (cs_etm_decoder__check_ver())
> +               return -EINVAL;
> +
>         /* First the global part */
>         ptr = (u64 *) auxtrace_info->priv;
>         num_cpu = ptr[CS_PMU_TYPE_CPUS] & 0xffffffff;
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
