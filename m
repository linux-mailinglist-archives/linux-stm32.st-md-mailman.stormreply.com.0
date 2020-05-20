Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1BD1DADF5
	for <lists+linux-stm32@lfdr.de>; Wed, 20 May 2020 10:49:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41E95C36B22;
	Wed, 20 May 2020 08:49:59 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46108C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2020 08:49:55 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u188so2018464wmu.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2020 01:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=NWaEHiofUdf6wDwIAUa4y4wi7tw1BiA51/qEMLgs6AU=;
 b=GuF8N+/dbPRSqOaevF9sTk9YryCPv4r7ZqF95iG8M/GZV046sf+1OpVYRUmJ752O9n
 tLXAERYZqA7k029FQshrGhBiG7tb2rtPY4ogy4K9IyTelhqOq+SVqMCmU49UIRwHlDxZ
 XJbwXHFhkhNqLBWhbTi4FFgUgCKGRUClXdUGodLuhTUp2TyZe4KEMoou11NlGQUA/wCq
 6IL8M5cqfbhyfM7K3u2w/YSXQG7ruenssF6HkITumCnwrTls78z0FPxhBCagma1UNfBB
 DNC8eumC5kfd7gwArsj/TdT7Kd0tYyKMNN79bt9sHM1SUcbk+xmLbHj+qCq/ltslGHEq
 D8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NWaEHiofUdf6wDwIAUa4y4wi7tw1BiA51/qEMLgs6AU=;
 b=hj+6vruIXBiThnMN4N2RzS5P5Zk0hJPQbJqmRokHBZNsi6M6zg4LpL0PwTOk/eFWoH
 lWjUJsFuDnVz71d87WKMsvNpV9pYKjCyqulKuSsfODe3JiF6rXNLJtyCVz6OBBsnuCi4
 ZJyqhWuX6WUvHJ0paqawv1awfuhC9xkJLy6p8v9fv90B3EulXeMJJXH+XWOqfnRLShmi
 lYU32n2sdkiUBNycRljbZeFbL1REngywB1g/F3BT5VbR6uquVgvJeWSzaU9NlOJa6xfV
 /07pqzFhsrH2zsALxBGY329Z+MBbg/UFJXIq2svqCpv/KV+7Ke4Fz6UOvX2NsMFmsmHC
 wPlw==
X-Gm-Message-State: AOAM530AiAPRpm4trwMDpBbT5AvpaeM3UJNNn1zbboGVq2/3K2+5ztNJ
 D6qhRGavTH55SZD5In2yZHmhBA==
X-Google-Smtp-Source: ABdhPJyep+rJQfzqk9gMxRBnRY9lMOYkgMnXKzNjAD/1SMDl4Fj2JnyisEDn3M3lozBwoT6aLNE+pg==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr3413772wmk.99.1589964595466; 
 Wed, 20 May 2020 01:49:55 -0700 (PDT)
Received: from dell ([95.149.164.102])
 by smtp.gmail.com with ESMTPSA id s8sm2168440wrg.34.2020.05.20.01.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 01:49:54 -0700 (PDT)
Date: Wed, 20 May 2020 09:49:53 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <20200520084953.GC271301@dell>
References: <20200107105959.18920-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107105959.18920-1-peter.ujfalusi@ti.com>
Cc: linux-kernel@vger.kernel.org, vkoul@kernel.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] mfd: stm32-timers: Use
 dma_request_chan() instead dma_request_slave_channel()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVHVlLCAwNyBKYW4gMjAyMCwgUGV0ZXIgVWpmYWx1c2kgd3JvdGU6Cgo+IGRtYV9yZXF1ZXN0
X3NsYXZlX2NoYW5uZWwoKSBpcyBhIHdyYXBwZXIgb24gdG9wIG9mIGRtYV9yZXF1ZXN0X2NoYW4o
KQo+IGVhdGluZyB1cCB0aGUgZXJyb3IgY29kZS4KPiAKPiBCeSB1c2luZyBkbWFfcmVxdWVzdF9j
aGFuKCkgZGlyZWN0bHkgdGhlIGRyaXZlciBjYW4gc3VwcG9ydCBkZWZlcnJlZAo+IHByb2Jpbmcg
YWdhaW5zdCBETUEuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVq
ZmFsdXNpQHRpLmNvbT4KPiAtLS0KPiBIaSwKPiAKPiBDaGFuZ2VzIHNpbmNlIHYxOgo+IC0gRmFs
bCBiYWNrIHRvIFBJTyBtb2RlIG9ubHkgaW4gY2FzZSBvZiBFTk9ERVYgYW5kIHJlcG9ydCBhbGwg
b3RoZXIgZXJyb3JzCj4gCj4gUmVnYXJkcywKPiBQZXRlcgo+IAo+ICBkcml2ZXJzL21mZC9zdG0z
Mi10aW1lcnMuYyB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKQXBwbGllZCwgdGhh
bmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2Fs
IExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZv
bGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
