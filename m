Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 524395A7CAF
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Aug 2022 13:58:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7DE4C04001;
	Wed, 31 Aug 2022 11:58:36 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AD48C03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Aug 2022 08:11:26 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-11eb8b133fbso18041272fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Aug 2022 01:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=IThx7ewIU6azW3sLn1BeaFcNjprihRTPt0DjgsNUm7k=;
 b=pM7HEjYq3ykY2Jtr2/pjZObHyCoUdu3gmLHwwYTyyGhI5HMOpq+emabjGGqdY1r+ue
 f+rekOkFSEEubZgRhOVX3vwbDwq21m5x/k/YOPLKvDCewEgANxOsxnZrEGGFufaIUeJP
 n+VIlK8Pditi8CWIXKv0WNOoHH77LWW2vpESN4l/1K81ltcYKF2TwqbMEYpGyKtRTajB
 kJcZFbRyNesHZSjH5iITgTSOFuGuoFI24BwGVCmCZ/uXgaSLaReTjAQnHlhuIAQMgPHj
 h2jJCDzkk9DcwQdnNoxps/OFFq+tn7UWc5c5aZST5kx3gs2tOnelJrKuJEZEMowK3Fhw
 pA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=IThx7ewIU6azW3sLn1BeaFcNjprihRTPt0DjgsNUm7k=;
 b=Cs2UXtnUtfKqEu0T8/CUgslGlXESm6VGhV1DD7FDTknR1g3baZGv9cl5isSDCJnjIV
 ulFoZbmoz3qvo3hxG4H9aNrqNg5H2yS/qWPtCGbdwHnZYKnWb0qJ4P0hvVfsYLdxEkLW
 eKhsuzLwgdZYsxZVOmIAW29gw8GytdHywzBsUc6luP8mjDnLfChHqzUgBqc414rpeSqD
 MouJ9L3JFDWmKJscVU+T3e5kx6YJ3bVgbzR2ZggaKlEns2NnQKHsAQXpnDCe6+LM7OL9
 wYLrva332W93UOA9pUSmfiu9uLfN9Cc3DeNANYnC+d1gobrrgBMO4vGxaucLqMl1HfsH
 sJZA==
X-Gm-Message-State: ACgBeo2PiL7Id/SOrmpINErQ4TRg8MbF0bJPYC5Dk9aoVGxbuUsMBLyX
 9vfXSMMy3IvcaOa4ag4N4jMhuueEla61jot5HX6xFg==
X-Google-Smtp-Source: AA6agR5BQP0YZDeoqoxupBK9/08QOD/DF2ceSgx9W2keBirZJCnci8BcWoypJX+YJum+Aqx9YzC7yXn5ejpJwAzFuCY=
X-Received: by 2002:a05:6808:8db:b0:344:fb71:2159 with SMTP id
 k27-20020a05680808db00b00344fb712159mr706259oij.34.1661933485314; Wed, 31 Aug
 2022 01:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220830172614.340962-1-james.clark@arm.com>
 <20220830172614.340962-2-james.clark@arm.com>
In-Reply-To: <20220830172614.340962-2-james.clark@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 31 Aug 2022 09:11:14 +0100
Message-ID: <CAJ9a7Vg41LZSLYvvk440-rR=BqU=qn80ZqHCJSfHUfkEQb8_UA@mail.gmail.com>
To: James Clark <james.clark@arm.com>
X-Mailman-Approved-At: Wed, 31 Aug 2022 11:58:36 +0000
Cc: mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, leo.yan@linaro.org,
 german.gomez@arm.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/5] coresight: Remove unused function
	parameter
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

On Tue, 30 Aug 2022 at 18:26, James Clark <james.clark@arm.com> wrote:
>
> The ability to use a custom function in this sysfs show function isn't
> used so remove it.
>
> No functional changes.
>
> Signed-off-by: James Clark <james.clark@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-priv.h | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index ff1dd2092ac5..f2458b794ef3 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -40,31 +40,23 @@
>  #define ETM_MODE_EXCL_KERN     BIT(30)
>  #define ETM_MODE_EXCL_USER     BIT(31)
>
> -typedef u32 (*coresight_read_fn)(const struct device *, u32 offset);
> -#define __coresight_simple_func(type, func, name, lo_off, hi_off)      \
> +#define __coresight_simple_show(type, name, lo_off, hi_off)            \
>  static ssize_t name##_show(struct device *_dev,                                \
>                            struct device_attribute *attr, char *buf)    \
>  {                                                                      \
>         type *drvdata = dev_get_drvdata(_dev->parent);                  \
> -       coresight_read_fn fn = func;                                    \
>         u64 val;                                                        \
>         pm_runtime_get_sync(_dev->parent);                              \
> -       if (fn)                                                         \
> -               val = (u64)fn(_dev->parent, lo_off);                    \
> -       else                                                            \
> -               val = coresight_read_reg_pair(drvdata->base,            \
> -                                                lo_off, hi_off);       \
> +       val = coresight_read_reg_pair(drvdata->base, lo_off, hi_off);   \
>         pm_runtime_put_sync(_dev->parent);                              \
>         return scnprintf(buf, PAGE_SIZE, "0x%llx\n", val);              \
>  }                                                                      \
>  static DEVICE_ATTR_RO(name)
>
> -#define coresight_simple_func(type, func, name, offset)                        \
> -       __coresight_simple_func(type, func, name, offset, -1)
>  #define coresight_simple_reg32(type, name, offset)                     \
> -       __coresight_simple_func(type, NULL, name, offset, -1)
> +       __coresight_simple_show(type, name, offset, -1)
>  #define coresight_simple_reg64(type, name, lo_off, hi_off)             \
> -       __coresight_simple_func(type, NULL, name, lo_off, hi_off)
> +       __coresight_simple_show(type, name, lo_off, hi_off)
>
>  extern const u32 coresight_barrier_pkt[4];
>  #define CORESIGHT_BARRIER_PKT_SIZE (sizeof(coresight_barrier_pkt))
> --
> 2.28.0
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
