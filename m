Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0212CE85B
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Dec 2020 08:00:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4354AC5663D;
	Fri,  4 Dec 2020 07:00:31 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43154C56637
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Dec 2020 00:04:55 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id s21so2431034pfu.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Dec 2020 16:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=tl5Utng9ytojtJagiqymkbPGSz2X+7BJN1ECR1XJmdk=;
 b=Wd3/5S5tk2qpeNkG1ZR6yr5Ao/cQdLRr+Xxc+RBPqqRGflpAxei2YGZamgE2qeI1Ql
 IW0+JlMniOfHCDVB11iWFvFOJ35JI3WJtssx0LkGQm+ZKTblndHLIsLrfbKfSycogDcT
 WIfS3K5tDqgohvZlt1qrI4G/ltTwvz6PXfcOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=tl5Utng9ytojtJagiqymkbPGSz2X+7BJN1ECR1XJmdk=;
 b=laAsxB1tTKMNhfNW7CbFnGvJ5qmaqM0cU3q5o9LRVg69mmtAanglPgsQIDwr8ggPZu
 dvLW4MQrJUCnPBeDIOvFGivgvtGhk1kXy4GLn5BlXvzKOIJl0dHD/14X3flpHUJwUO/z
 PHPplM0WxhRv5dlJijoD0ufd/8cahJG6dPi4tXsdMjZFP7hMyndDl/lHoBGhLL42DOLy
 mpXwpRCAWtrHA065NmQwGMrJ9QgokY+q8i+601D642iWY3g3pYStfOjmm8nomuIgZPOk
 UL8oWpSzjw5Hwz8vy8LERJlIkG2NtM2dZ23gaDjD3JDsluyOsReBgODpqRSn0n9IdSHu
 RdTg==
X-Gm-Message-State: AOAM530X34PBAlo8Iff5PbGD/9OTu8PCi7DCYmx+Vsq0HaoP0C7w+6zT
 n4MM+B8QbdbrX2k822pePR1VIQ==
X-Google-Smtp-Source: ABdhPJwqWAtfUq0a7sJA6kpYXTEPQNtxrnLYrGTjJeUVg2jwAslTLepC7yHks13wUQXND/NxfuaxEg==
X-Received: by 2002:a63:c749:: with SMTP id v9mr5125868pgg.451.1607040294421; 
 Thu, 03 Dec 2020 16:04:54 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id p7sm2858430pfn.56.2020.12.03.16.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 16:04:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20201203231232.1482792-1-arnd@kernel.org>
References: <20201203231232.1482792-1-arnd@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>, Kim Phillips <kim.phillips@arm.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Date: Thu, 03 Dec 2020 16:04:52 -0800
Message-ID: <160704029234.1580929.9183785406117157105@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Fri, 04 Dec 2020 07:00:29 +0000
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 coresight@lists.linaro.org, Mian Yousaf Kaukab <ykaukab@suse.de>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Leo Yan <leo.yan@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <dan.carpenter@oracle.com>, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] coresight: remove broken __exit
	annotations
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

Quoting Arnd Bergmann (2020-12-03 15:11:40)
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Functions that are annotated __exit are discarded for built-in drivers,
> but the .remove callback in a device driver must still be kept around
> to allow bind/unbind operations.
> 
> There is now a linker warning for the discarded symbol references:
> 
> `tmc_remove' referenced in section `.data' of drivers/hwtracing/coresight/coresight-tmc-core.o: defined in discarded section `.exit.text' of drivers/hwtracing/coresight/coresight-tmc-core.o
> `tpiu_remove' referenced in section `.data' of drivers/hwtracing/coresight/coresight-tpiu.o: defined in discarded section `.exit.text' of drivers/hwtracing/coresight/coresight-tpiu.o
> `etb_remove' referenced in section `.data' of drivers/hwtracing/coresight/coresight-etb10.o: defined in discarded section `.exit.text' of drivers/hwtracing/coresight/coresight-etb10.o
> `static_funnel_remove' referenced in section `.data' of drivers/hwtracing/coresight/coresight-funnel.o: defined in discarded section `.exit.text' of drivers/hwtracing/coresight/coresight-funnel.o
> `dynamic_funnel_remove' referenced in section `.data' of drivers/hwtracing/coresight/coresight-funnel.o: defined in discarded section `.exit.text' of drivers/hwtracing/coresight/coresight-funnel.o
> `static_replicator_remove' referenced in section `.data' of drivers/hwtracing/coresight/coresight-replicator.o: defined in discarded section `.exit.text' of drivers/hwtracing/coresight/coresight-replicator.o
> `dynamic_replicator_remove' referenced in section `.data' of drivers/hwtracing/coresight/coresight-replicator.o: defined in discarded section `.exit.text' of drivers/hwtracing/coresight/coresight-replicator.o
> `catu_remove' referenced in section `.data' of drivers/hwtracing/coresight/coresight-catu.o: defined in discarded section `.exit.text' of drivers/hwtracing/coresight/coresight-catu.o
> 
> Remove all those annotations.
> 
> Fixes: 8b0cf82677d1 ("coresight: stm: Allow to build coresight-stm as a module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
