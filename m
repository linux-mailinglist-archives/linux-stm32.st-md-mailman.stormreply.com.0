Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A42F3A4FD35
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 12:07:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67C13C7128A;
	Wed,  5 Mar 2025 11:07:58 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7897DCFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 11:07:57 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-22359001f1aso150353655ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Mar 2025 03:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741172876; x=1741777676;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h8Cx5fHR+4jmiXuXaT5oD7FRlDS4S8GZIWX7AhsEi0w=;
 b=KMeVc3aforLqayBOoEahlJDYFU1GIwZXVMbcI4ooqn19k6TEg8xaNZ6V3ZSBSRcnMA
 dQz+h2fRGfCpdiqs9lG+as8dGj6qYIqortxAH4IecKz8I8Z5dyCEPH4iPapXG0fqLMpS
 ICaKwizVLjcy9JI6XTJbx9L0n3rHJGooWPx4y9+jcPlAXKP7sqDnpSvF9/z23y7+VCYa
 ZWFIRym2wcBpDFJqb0U+EARMtVXrjDeM36mZWky9t2K/q0sThcA6+yDry8tV52vc7vCG
 wT9m3o94SMY1D3bIIedBaad09pOzwnMjI2h6y46NKxWFSB/N6IQHL1WQYoTRqoeZXQ1H
 EaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741172876; x=1741777676;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h8Cx5fHR+4jmiXuXaT5oD7FRlDS4S8GZIWX7AhsEi0w=;
 b=kjD3B6QXliHucQ+0MWK1PCOcdA6aEmrnBYYITyF+RAjdermIdEQ3wLGHdXm5BBIpzi
 YGYCA7E2xMd/wjd2KDkhn8i7BTfYGBldXmTf8Yo7CKuUCHQWmi6vXJgm2RkJYtm/V7oj
 cM9XixqTl2tePVvAIW5325SzTJlrFtNhTwhxmXFlow94IptKdK3eC9BlrQqbHOrqXC39
 a67OVlYTSIBDgetU2OaNuZNDb0zCucs8NFNiV4zJ8ROPT2xHhm1DPwgqHRW14G4uKCBJ
 bK/O9cwrQGRdl42Zl6VxDhM2WKckVMXmyMTz4R1tNP+qx6xNqbClLZfg0xzsvevgjrI2
 iZcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMdcwo2KFmb42dvbeX2MSpKtg1eabVrEJUxNDxAOqfjMpwedElhfamtoaLhMD3fkDEJ6tPhNd3x6Nh+A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwoOT6dl0SZVejPbBrL+e0KqnUtQYh1QYNT5CaDlTDBZAvcsgFR
 bZtgucuo6vQDdEGwHJtoUYJsI8N1K21OOohItaPdHKoP7YBKjP+Kw+UJsbKozbVLczm8rPhtUF8
 VpIQiP9FThDb3161cmQBBXlh/3mFv9ghHgmlLhg==
X-Gm-Gg: ASbGncvCbzfyHUVvNbBMG8c+/V6AdRxFNINimfnGFoo+cPrQP9A3T/+5tm2swvZbNpO
 TQ7D+Nvtwi04uF+HMwF5nSUgW63TElNA7gAupFzkf3CF45EcVboMYMz4jyDvijaYTQ6ESwRMhUR
 K93txZaRf9uCKig+cAIXdINW3f4iH+IihVlR46fod2wetimE1f21jvBEH091o=
X-Google-Smtp-Source: AGHT+IGeHajtM6a8RKzvxRCPhC7Gav1e5qdV7p0kvwl/9Chh9iSgselzALrtnrWd7JtUMEd3C1yGOLe31+tUVRNx8X0=
X-Received: by 2002:a05:6a00:3d4a:b0:736:4b08:cc0e with SMTP id
 d2e1a72fcca58-73682c53721mr3253307b3a.17.1741172875711; Wed, 05 Mar 2025
 03:07:55 -0800 (PST)
MIME-Version: 1.0
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-3-quic_jiegan@quicinc.com>
In-Reply-To: <20250303032931.2500935-3-quic_jiegan@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 5 Mar 2025 11:07:43 +0000
X-Gm-Features: AQ5f1Jotwj7vHwxJWb6wdXEyjYphyVf5Uwhw-vghsgB9wb3Lu4bYOf2iNdASjeU
Message-ID: <CAJ9a7VgGp4YqzN-yx0x+NiZG8now6SCmnimaou2Z=exYcoiegw@mail.gmail.com>
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, James Clark <james.clark@linaro.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 coresight@lists.linaro.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v15 02/10] Coresight: Add trace_id
 function to retrieving the trace ID
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

Hi,

On Mon, 3 Mar 2025 at 03:30, Jie Gan <quic_jiegan@quicinc.com> wrote:
>
> Add 'trace_id' function pointer in coresight_ops. It's responsible for retrieving
> the device's trace ID.
>
> Co-developed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: James Clark <james.clark@linaro.org>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c  | 30 +++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-dummy.c | 13 +++++++-
>  .../coresight/coresight-etm3x-core.c          |  1 +
>  .../coresight/coresight-etm4x-core.c          |  1 +
>  drivers/hwtracing/coresight/coresight-stm.c   | 11 +++++++
>  drivers/hwtracing/coresight/coresight-tpda.c  | 11 +++++++
>  include/linux/coresight.h                     |  5 ++++
>  7 files changed, 71 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index ab55e10d4b79..32aa07f4f8c1 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -24,6 +24,7 @@
>  #include "coresight-etm-perf.h"
>  #include "coresight-priv.h"
>  #include "coresight-syscfg.h"
> +#include "coresight-trace-id.h"
>
>  /*
>   * Mutex used to lock all sysfs enable and disable actions and loading and
> @@ -1557,6 +1558,35 @@ void coresight_remove_driver(struct amba_driver *amba_drv,
>  }
>  EXPORT_SYMBOL_GPL(coresight_remove_driver);
>
> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
> +                              struct coresight_device *sink)
> +{
> +       int trace_id;
> +       int cpu = source_ops(csdev)->cpu_id(csdev);
> +

This is a global funciton so need to check that this csdev is a
source,. and does provide a cpu  function before calling it.

> +       switch (mode) {
> +       case CS_MODE_SYSFS:
> +               trace_id = coresight_trace_id_get_cpu_id(cpu);
> +               break;
> +       case CS_MODE_PERF:
> +               if (WARN_ON(!sink))
> +                       return -EINVAL;
> +
> +               trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
> +               break;
> +       default:
> +               trace_id = -EINVAL;
> +               break;
> +       }
> +
> +       if (!IS_VALID_CS_TRACE_ID(trace_id))
> +               dev_err(&csdev->dev,
> +                       "Failed to allocate trace ID on CPU%d\n", cpu);
> +
> +       return trace_id;
> +}
> +EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
> +
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
>  MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> index 9be53be8964b..b5692ba358c1 100644
> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> @@ -41,6 +41,16 @@ static void dummy_source_disable(struct coresight_device *csdev,
>         dev_dbg(csdev->dev.parent, "Dummy source disabled\n");
>  }
>
> +static int dummy_source_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> +                                __maybe_unused struct coresight_device *sink)
> +{
> +       struct dummy_drvdata *drvdata;
> +
> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       return drvdata->traceid;
> +}
> +
>  static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
>                                 void *data)
>  {
> @@ -62,7 +72,8 @@ static const struct coresight_ops_source dummy_source_ops = {
>  };
>
>  static const struct coresight_ops dummy_source_cs_ops = {
> -       .source_ops = &dummy_source_ops,
> +       .trace_id       = dummy_source_trace_id,
> +       .source_ops     = &dummy_source_ops,
>  };
>
>  static const struct coresight_ops_sink dummy_sink_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index c103f4c70f5d..c1dda4bc4a2f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -704,6 +704,7 @@ static const struct coresight_ops_source etm_source_ops = {
>  };
>
>  static const struct coresight_ops etm_cs_ops = {
> +       .trace_id       = coresight_etm_get_trace_id,
>         .source_ops     = &etm_source_ops,
>  };
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2c1a60577728..cfd116b87460 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1067,6 +1067,7 @@ static const struct coresight_ops_source etm4_source_ops = {
>  };
>
>  static const struct coresight_ops etm4_cs_ops = {
> +       .trace_id       = coresight_etm_get_trace_id,
>         .source_ops     = &etm4_source_ops,
>  };
>
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index b581a30a1cd9..aca25b5e3be2 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -281,12 +281,23 @@ static void stm_disable(struct coresight_device *csdev,
>         }
>  }
>
> +static int stm_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> +                       __maybe_unused struct coresight_device *sink)
> +{
> +       struct stm_drvdata *drvdata;
> +
> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       return drvdata->traceid;
> +}
> +
>  static const struct coresight_ops_source stm_source_ops = {
>         .enable         = stm_enable,
>         .disable        = stm_disable,
>  };
>
>  static const struct coresight_ops stm_cs_ops = {
> +       .trace_id       = stm_trace_id,
>         .source_ops     = &stm_source_ops,
>  };
>
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 573da8427428..94c2201fc8d3 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -241,12 +241,23 @@ static void tpda_disable(struct coresight_device *csdev,
>         dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
>  }
>
> +static int tpda_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> +                        __maybe_unused struct coresight_device *sink)
> +{
> +       struct tpda_drvdata *drvdata;
> +
> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       return drvdata->atid;
> +}
> +
>  static const struct coresight_ops_link tpda_link_ops = {
>         .enable         = tpda_enable,
>         .disable        = tpda_disable,
>  };
>
>  static const struct coresight_ops tpda_cs_ops = {
> +       .trace_id       = tpda_trace_id,
>         .link_ops       = &tpda_link_ops,
>  };
>
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index c7cd5886c908..ce9a5e71b261 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -335,6 +335,7 @@ enum cs_mode {
>         CS_MODE_PERF,
>  };
>
> +#define coresight_ops(csdev)   csdev->ops
>  #define source_ops(csdev)      csdev->ops->source_ops
>  #define sink_ops(csdev)                csdev->ops->sink_ops
>  #define link_ops(csdev)                csdev->ops->link_ops
> @@ -421,6 +422,8 @@ struct coresight_ops_panic {
>  };
>
>  struct coresight_ops {
> +       int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
> +                       struct coresight_device *sink);
>         const struct coresight_ops_sink *sink_ops;
>         const struct coresight_ops_link *link_ops;
>         const struct coresight_ops_source *source_ops;
> @@ -709,4 +712,6 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
>
>  void coresight_remove_driver(struct amba_driver *amba_drv,
>                              struct platform_driver *pdev_drv);
> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
> +                              struct coresight_device *sink);
>  #endif         /* _LINUX_COREISGHT_H */
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
