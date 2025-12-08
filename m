Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64221CAC73A
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Dec 2025 09:04:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB044C58D77;
	Mon,  8 Dec 2025 08:04:07 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AD92C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Dec 2025 08:04:06 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5942bac322dso4147036e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Dec 2025 00:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765181045; x=1765785845;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
 b=Sv6KQS+zokrvfitGAblPDZbxKtIe6qFTKjgxNilpjm2INejY67mM7X9JDnPczdgsmv
 DlCEV9PKvz52+x/OXzQWGo+kTdCbwI/7CYGjfimUQxEujF2KE2b5x3Rs9GuUseFve/Lp
 7Wq1Xp2X86FJQcTjxBnHjmuaRvUTKoFgxK2egbPqh4naHtUITJ+2OUtt9cjok//uUi/c
 iVeS3p7KKQZJDdIdgG3VN0HRgmcL42mIhN9nznT3621glZK9IhArXuVEI+6L2J6gc7hh
 zWyNrSed7dp7VCpnM0+pIk77dgULgcaou/w56mJRQHuKUVx6MulmPrQHWKdV8pYf7JnK
 uoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765181045; x=1765785845;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
 b=SMSMsWeVa3oSnU7aS2cvhWxPuzM5yM4L4RK3R6qSLbqXptfnxGsAhHWUbafVdSZyt8
 Mxg8EY60Vba7S8CpDRCDGBdx46hFj5KnzbVpTs0tsrqXlVT+PCzC8VevuGJCtIF0Cfxr
 hKqdJiXJcidsgNRviYhbK/S/+gC6Euem1GMY00ruoiPwk6gmZ5Ktrf9nK3/mwXmCiYWJ
 DpJMbMORwcBlVuhb7O2RSfb0clCyjV2Kekdvri0FtbaZK4fBmQfprMJInQiRTJ+0CSR+
 mvc2/Wlfa0ZJCLfQRskbJ5Lh+Z3OH3B98BYv4RAwHodQWu0D1HV3pnpOT0PH6MEUGE/z
 HUMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+ZKPsINyTWrb9bYWrQYe/R0qa3vGTQmWJ9IAVmrPZ/pAc21H+XoFGogYt6+Vy8KmctKet03qKSU+qfw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyEQ3X1BGJwS8la4vf+Gx7emxNNEYrxAp+PqZ2VXqRjsQb5UUVD
 NplKBB9oc02c9WMi8rSBm3eoHV66kjI6DUzPMJmVN4fed7jt83RZkv6Z
X-Gm-Gg: ASbGnctzxg8uh/jnZXn7lgiEyWOB1EXgHtcxFLGfwmr3cN1C4t7ISeHf4pYFORCjDCG
 rnUKiEC5LmveLezhrz0GLYITWP5mJMTaEsPUa9pCR/I1mHK2OJDFCQ9Gt6QGUBN7PTMBb5EDCdg
 +203EFSUfHLfEhmFX47iX+A2V9e7UDZge+oTUEJ6b2nx400HofjTC9s1CHlMm7IqhJP6SRZXiJx
 3YTvO2aMt50nVNYlNhoRUAQFbNsr/GH2uQ7+5GQGTqas4QSFAOD8CQdc6W6KkDuwXwzp56K1gWx
 R/Zk4SxNlBnMvr8K0fPBZXQScUZLAd5s8wrazoGpGhc1GlSSlifb9CVhQgUU6XePywEvw3stUsP
 LhnAr1LAQojwxg2n9WEmx9DsgnXqHNnvGbcOvdqRDjcamTRxHSfHUwkO9+wPaoE8CCDFFBgVQ5+
 oiULKHVOP/AX2b6VQusM+QIPQOxw4AwE2EEJUKTF3c/A7hAn0szpZZWRkItWB2hIqx6jUDp3Vw0
 XNF2C4=
X-Google-Smtp-Source: AGHT+IEtsjzvo2jB+dbI9VQ7yZrjbx6yvK3VRttDJmqZME09yWJ/CiejjRuxkvbF6yvGpf9tC/V6mQ==
X-Received: by 2002:a05:6512:104f:b0:592:fb5d:6300 with SMTP id
 2adb3069b0e04-5987e88bb77mr1971804e87.10.1765181045203; 
 Mon, 08 Dec 2025 00:04:05 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703?
 ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7c1e2b7sm3942418e87.51.2025.12.08.00.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 00:04:04 -0800 (PST)
Message-ID: <bcbe66b0-23bc-4ba1-93ab-f2c09262e07b@gmail.com>
Date: Mon, 8 Dec 2025 10:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Cc: linux-sh@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 andrew.jones@linux.dev, Paul Cercueil <paul@crapouillou.net>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, openbmc@lists.ozlabs.org, x86@kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org,
 asahi@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] Kconfig dangling references (BZ 216748)
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

On 08/12/2025 04:04, Randy Dunlap wrote:
> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
> 
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries that were noise).
> 
> I'll try to Cc: all of the relevant mailing lists or individuals.
> 

Thanks Randy! This is good.

> TEST_KUNIT_DEVICE_HELPERS ---
> drivers/iio/test/Kconfig:11:	select TEST_KUNIT_DEVICE_HELPERS
This is a config for stuff that never went upstream. It was replaced by 
more sophisticated kunit_device, which I believe is behind the 
'CONFIG_KUNIT'. So, this should be dropped, thanks!

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
