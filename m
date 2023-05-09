Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3292E6FC0C2
	for <lists+linux-stm32@lfdr.de>; Tue,  9 May 2023 09:52:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD205C6A608;
	Tue,  9 May 2023 07:52:09 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A753C6A5F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 May 2023 07:52:09 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-307664010fdso4845643f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 May 2023 00:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683618728; x=1686210728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AiJ7j1UJ/LHlbk27yV5v4iaBxOzxNWaEAWpsBwu4K1A=;
 b=vjnA/N0wYP3JqBq0LLnPmY5ySAhBGZ45WZz+1ago1Razib7wJoAVGwVCPdoVGISI/d
 soAW/KkFE6Q9i14xhTWawPMvnao0Oj/c1rWhgExXYgo7VJdlo2BJiumnj03gzDL3DYHp
 zxjp+zinNpZcebIEZCyWeDbaEMkaG8e6AbZFeYZ3+oYVv76YYPQoT0bG87E9muOV2Rvy
 IB3Cr4V++wky/Mm/gY3lysEyssFSKAJ9kFu7mdYiuXc/MDO/M2IBB8tEet16Mc3azG2O
 3+CjALJ2my6fdZR5EYCLJM9bNhU5YNBFyC4EWEGQikjdfIi1ydwpimRtuLDTmrcQD679
 dhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683618728; x=1686210728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AiJ7j1UJ/LHlbk27yV5v4iaBxOzxNWaEAWpsBwu4K1A=;
 b=P3yJitWBEqkrr0cMmIZ+Cc58EjYN5YbC15Duqq9EGIRGPdPajBQKm3pGThh8eAVHMz
 OA7WDCiRDMwBzLVFg5F7T8B8XFDPVsoe9gTlcFN1UoSiGUSLEZSh3CmZBIO0G97G03YR
 bqRoaX3sBGQqCNco8R88j0DjMKeXiUffHDPWPr9hzxfHKZh+i2Lheg7+sjJcYzwZbk+F
 K9cJi5stLvzO60D+MWGWQlEdvy2HLuQBUP/TS1t32imlUinnjTtvHONLwMZFOqj4XUnU
 aT552wLsHa6L7rCaT4mF4h5CCUcSUyeNyiHR/BQP34hLF7ZMWlnpTZpG5InuPEzg7Sm4
 T1vA==
X-Gm-Message-State: AC+VfDx4dkQ7A/qviLqoz0G+Hhuh4AcdKGTa94SdJo48GSZQabgRxu8W
 JZQfID2erOMTEZWV5LGo4Y2U0+L6M56zT8GzW3ML5A==
X-Google-Smtp-Source: ACHHUZ77GpidyDYIXFEMgkHoj7nqJ/307eHJcLHJeO+DhUlVx5SZRURaeMCdJvEWfKUhMwqMENMCtgi6rH1kQyKcaXI=
X-Received: by 2002:adf:e690:0:b0:2e8:b9bb:f969 with SMTP id
 r16-20020adfe690000000b002e8b9bbf969mr9090559wrm.0.1683618728362; Tue, 09 May
 2023 00:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
 <20230508142637.1449363-7-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508142637.1449363-7-u.kleine-koenig@pengutronix.de>
From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date: Tue, 9 May 2023 13:21:56 +0530
Message-ID: <CAH=2Ntyc-Oi-FCNQJbLwgyWT8Tt7tVpHO7HOc=hM2RdNweOzjg@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <simon.horman@corigine.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 06/11] net: stmmac:
 dwmac-qcom-ethqos: Convert to platform remove callback returning void
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

SGkgVXdlLAoKT24gTW9uLCA4IE1heSAyMDIzIGF0IDE5OjU2LCBVd2UgS2xlaW5lLUvDtm5pZwo8
dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IFRoZSAucmVtb3ZlKCkg
Y2FsbGJhY2sgZm9yIGEgcGxhdGZvcm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1ha2Vz
Cj4gbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRv
IGVycm9yIGhhbmRsaW5nIGJ5Cj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhvd2V2ZXIgdGhl
IHZhbHVlIHJldHVybmVkIGlzIChtb3N0bHkpIGlnbm9yZWQKCl5eXiBtb3N0bHksIGhlcmUgc2Vl
bXMgY29uZnVzaW5nLiBPbmx5IGlmIHRoZSByZXR1cm4gdmFsdWUgaXMgaWdub3JlZAptYXJraW5n
IHRoZSBmdW5jdGlvbgphcyAndm9pZCcgbWFrZXMgc2Vuc2UgSU1PLgoKPiBhbmQgdGhpcyB0eXBp
Y2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFrcy4gVG8gaW1wcm92ZSBoZXJlIHRoZXJlIGlz
IGEKPiBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKPiBxdWVzdCBhbGwgZHJpdmVycyBhcmUgY29udmVydGVkIHRv
IC5yZW1vdmVfbmV3KCkgd2hpY2ggYWxyZWFkeSByZXR1cm5zCj4gdm9pZC4KPgo+IFRyaXZpYWxs
eSBjb252ZXJ0IHRoaXMgZHJpdmVyIGZyb20gYWx3YXlzIHJldHVybmluZyB6ZXJvIGluIHRoZSBy
ZW1vdmUKPiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KPgo+IFJldmll
d2VkLWJ5OiBTaW1vbiBIb3JtYW4gPHNpbW9uLmhvcm1hbkBjb3JpZ2luZS5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5k
ZT4KPiAtLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNv
bS1ldGhxb3MuYyB8IDYgKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMKPiBpbmRleCBiZjE3YzZjOGYyZWIuLjFk
Yjk3YTUyMDljNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+IEBAIC02NjUsMTQgKzY2NSwxMiBAQCBz
dGF0aWMgaW50IHFjb21fZXRocW9zX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiAtc3RhdGljIGludCBxY29tX2V0aHFvc19y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiArc3RhdGljIHZvaWQgcWNvbV9l
dGhxb3NfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAgICAgICAg
IHN0cnVjdCBxY29tX2V0aHFvcyAqZXRocW9zID0gZ2V0X3N0bW1hY19ic3BfcHJpdigmcGRldi0+
ZGV2KTsKPgo+ICAgICAgICAgc3RtbWFjX3BsdGZyX3JlbW92ZShwZGV2KTsKPiAgICAgICAgIGV0
aHFvc19jbGtzX2NvbmZpZyhldGhxb3MsIGZhbHNlKTsKPiAtCj4gLSAgICAgICByZXR1cm4gMDsK
PiAgfQo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHFjb21fZXRocW9zX21h
dGNoW10gPSB7Cj4gQEAgLTY4NSw3ICs2ODMsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBx
Y29tX2V0aHFvc19tYXRjaCk7Cj4KPiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgcWNv
bV9ldGhxb3NfZHJpdmVyID0gewo+ICAgICAgICAgLnByb2JlICA9IHFjb21fZXRocW9zX3Byb2Jl
LAo+IC0gICAgICAgLnJlbW92ZSA9IHFjb21fZXRocW9zX3JlbW92ZSwKPiArICAgICAgIC5yZW1v
dmVfbmV3ID0gcWNvbV9ldGhxb3NfcmVtb3ZlLAo+ICAgICAgICAgLmRyaXZlciA9IHsKPiAgICAg
ICAgICAgICAgICAgLm5hbWUgICAgICAgICAgID0gInFjb20tZXRocW9zIiwKPiAgICAgICAgICAg
ICAgICAgLnBtICAgICAgICAgICAgID0gJnN0bW1hY19wbHRmcl9wbV9vcHMsCj4gLS0KPiAyLjM5
LjIKCkFsc28gYSBzbWFsbCBub3RlIChtYXliZSBhIFRCRCkgaW5kaWNhdGluZyB0aGF0ICdyZW1v
dmVfbmV3JyB3aWxsIGJlCmV2ZW50dWFsbHkgcmVwbGFjZWQgd2l0aCAncmVtb3ZlJyB3b3VsZCBt
YWtlIHJlYWRpbmcgdGhpcyBlYXNpZXIuIFJlc3QKc2VlbXMgZmluZSwgc286CgpSZXZpZXdlZC1i
eTogQmh1cGVzaCBTaGFybWEgPGJodXBlc2guc2hhcm1hQGxpbmFyby5vcmc+CgpUaGFua3MuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
