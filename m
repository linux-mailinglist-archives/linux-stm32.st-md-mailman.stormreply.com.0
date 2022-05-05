Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 046D551B53F
	for <lists+linux-stm32@lfdr.de>; Thu,  5 May 2022 03:29:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB70EC6046B;
	Thu,  5 May 2022 01:29:26 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD849C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 01:29:24 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id n18so3040988plg.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 May 2022 18:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=axmZLYy89B3XsolG0763PYww9N2YXIvHmGNfehtY9bU=;
 b=cdCo8Q+RrEP+/j/j1NMrf5VnG+nCqXx/wR6uxeJ4EL0CasKAs3hhxdG3sPLWTaRnJ5
 mskeeCwDpCtFm8a20V32z20Fg73iOFzc3pkB3a4ukjrv0NOfd41zBYVokdKZYyRqV455
 c/q8uTjRf3tzLB5YC4d/Ec0qVQ1XPLzpTDNlWOGS5NfnXwjDxiBOmcGGqsLkDCdoH3/A
 xBfK97HYnrCgq4dFjBY9FcmkyY6Z7V2BMOsJ8b8zt5aABZQ+Icm+DArfGzVr+ELmtXHz
 b11LNCvq6bOtMm+2dlTLYfGX1Bs/rCthXtITHDhS6f/qK14wXffdTmnE+OprS5cEfKh9
 xuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=axmZLYy89B3XsolG0763PYww9N2YXIvHmGNfehtY9bU=;
 b=T4/N3bfuQcPswvGjRfIBJpNqYOtB/9IHunZY3Na0z80uFdOP7CD/r07VOLZSv/xGRU
 v2NtUnH8zyJaL/NZsP1XGztiNNyP5wc4e5QtQKLt/XAUQaN98Zsl+rwOw2pqhHtgjhS5
 wuhOnzRjKSLovXebo0xea4LvlCPMSoYrsXPUSFpP5APhafeA57DlqSualwKqjfm1NQnY
 3NsusKb3PotqUvapZeiSsx4AchnZJmMdCi4Z1y5+w7CjXb3sh+UlSt8geySRIRQunKTd
 t1TPn66c+mDW/Ey7V3uBeMgnJYbppEMIolwVszVS3ouREHoki4G2hzkcDObr+Mvc9ORY
 Y0Xg==
X-Gm-Message-State: AOAM532Q1vuhlPTpti7/Dpek8JX5qXUyXrJ4Nz5QT0MitircFW9zFYPH
 ILyteiH4XGTYEsdBMjYciu8sf8YEc1A=
X-Google-Smtp-Source: ABdhPJyoSuEoqs49Mg1qwZdYE3bbRPnsDNIoBDGM4MqV+4CWc+1FfvWMI5m2H+yeZ875spqYgJf3Ww==
X-Received: by 2002:a17:902:ef49:b0:15e:b6ed:4832 with SMTP id
 e9-20020a170902ef4900b0015eb6ed4832mr10897989plx.173.1651714163285; 
 Wed, 04 May 2022 18:29:23 -0700 (PDT)
Received: from [192.168.50.247] ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902d48200b0015e8d4eb24asm136572plg.148.2022.05.04.18.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 18:29:22 -0700 (PDT)
Message-ID: <3e01d35c-e748-3e03-4417-8b7dea09075e@gmail.com>
Date: Thu, 5 May 2022 09:29:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: alexander.shishkin@linux.intel.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, gregkh@linuxfoundation.org,
 mathieu.poirier@linaro.org
References: <20220418081632.35121-1-hbh25y@gmail.com>
From: Hangyu Hua <hbh25y@gmail.com>
In-Reply-To: <20220418081632.35121-1-hbh25y@gmail.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] hwtracing: stm: fix possible double free
 in stm_register_device()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Ping

On 2022/4/18 16:16, Hangyu Hua wrote:
> put_device() will call stm_device_release() to free stm when
> stm_register_device() fails. So there is no need to call vfree() again.
> 
> Fix this by adding a return after put_device().
> 
> Fixes: 7bd1d4093c2f ("stm class: Introduce an abstraction for System Trace Module devices")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>   drivers/hwtracing/stm/core.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
> index 2712e699ba08..403b4f41bb1b 100644
> --- a/drivers/hwtracing/stm/core.c
> +++ b/drivers/hwtracing/stm/core.c
> @@ -915,6 +915,7 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
>   
>   	/* matches device_initialize() above */
>   	put_device(&stm->dev);
> +	return err;
>   err_free:
>   	vfree(stm);
>   
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
