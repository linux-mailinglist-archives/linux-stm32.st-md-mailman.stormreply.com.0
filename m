Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E66978189A2
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Dec 2023 15:19:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BE40C6B461;
	Tue, 19 Dec 2023 14:19:59 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 125EAC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 14:19:57 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dbd5192d5e8so739297276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 06:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702995597; x=1703600397;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=udO5JdiwtE99JnEZ5ly9pAA3TWaydCoVrlitP8BJQG4=;
 b=uE7h38n3cq2y9X0uiLTbmmapKW5UcY41hIi2AhTHy07Jw0wA8Eku0h+SKHApuLpqrv
 48FKmIPRm3myKn4YZi7oqJnGy2csqsHLtiKWd1Q5q7wzKVXkj3CbRWk0CAtfgzk0rzrz
 0lPTM2P8YKff5YgrXLsf4E2r+znYmpavufpoSEoFBLL8jW2QfmM7zMjKuoCtlvZLmj/m
 bpQykvvsmrbvYSx8vGCxpZ0xtZsHlubVv1G2l5GXtyztW5lBCdVujZ5V82ldRlAiWfyK
 mQft6qsDV/ixvRJg+4FGKACEB52uLdJZz+MQ+cttZ8hcDLjrjjN5cdMwf5u6mLngKnm7
 VyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702995597; x=1703600397;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=udO5JdiwtE99JnEZ5ly9pAA3TWaydCoVrlitP8BJQG4=;
 b=H6eh5XQEO7001j6MJISDYnLroib6mXdFx6uOVXBivz0vOycY2TE9WRmm9SZynEdFcp
 UpViqxKHDuzDEm1LddBmLtgKWhG4xR8hHGI7PR2Bx0DRHpLFroFbQXTU0n/TeKKstKbo
 JMRQ9Gr7/srAGi2/4Y8mB0UxxPNCY+migaAQ8PxIJRMy6qzcZhfRm82rSNCQRWbA3vr/
 N2nhxNcQ9JaFvUKby/EEgmc9+MBGOUWmQnsz2/R23zyvTkyxrmWICzr1uG/HjDbMXszK
 5CGtQu2ZyoU6gkBhSBYufShOv7XKPZ2FBkoeI19iDzG5GfObx3q6T8Ec9IwlrXhmHcHZ
 rTbQ==
X-Gm-Message-State: AOJu0YxDQnn9tFX9RXx1wGHF3mHAzcSJsOJ78V0XkoAAnFQ3Duq3/iQy
 VQ3lOpc2lDhRzAYRciQF/SHLpXHGd/tAbsqbYdNaDQ==
X-Google-Smtp-Source: AGHT+IHaONPPt0yp11P4xWjwUfRR430BJRxfeWYtV2bqNtIe/9eVYDMx97tuw/H4MF1jSSyV3o2q+8Nyj6JP8FiXw+Y=
X-Received: by 2002:a25:230e:0:b0:dbd:5ccd:f197 with SMTP id
 j14-20020a25230e000000b00dbd5ccdf197mr357230ybj.121.1702995596901; Tue, 19
 Dec 2023 06:19:56 -0800 (PST)
MIME-Version: 1.0
References: <20231218162326.173127-1-romain.gantois@bootlin.com>
 <20231218162326.173127-2-romain.gantois@bootlin.com>
 <20231219122034.pg2djgrosa4irubh@skbuf>
 <20231219140754.7a7a8dbd@device-28.home>
In-Reply-To: <20231219140754.7a7a8dbd@device-28.home>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Dec 2023 15:19:45 +0100
Message-ID: <CACRpkdaxy9u=1-rQ+f+1tb8xyV-GYOuq52xhb4_SRPk9-LpnUA@mail.gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Prevent DSA tags
	from breaking COE
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

T24gVHVlLCBEZWMgMTksIDIwMjMgYXQgMjowN+KAr1BNIE1heGltZSBDaGV2YWxsaWVyCjxtYXhp
bWUuY2hldmFsbGllckBib290bGluLmNvbT4gd3JvdGU6Cgo+IFNvIGl0IGxvb2tzIGxpa2UgYW4g
YWNjZXB0YWJsZSBzb2x1dGlvbiB3b3VsZCBiZSBzb21ldGhpbmcgYWxvbmcgdGhlCj4gbGluZXMg
b2Ygd2hhdCBMaW51cyBpcyBzdWdnZXN0aW5nIGhlcmUgOgo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbmV0ZGV2LzIwMjMxMjE2LW5ldy1nZW1pbmktZXRoZXJuZXQtcmVncmVzc2lvbi12Mi0y
LTY0YzI2OTQxM2RmYUBsaW5hcm8ub3JnLwo+Cj4gSWYgc28sIG1heWJlIGl0J3Mgd29ydGggYWRk
aW5nIGEgbmV3IGhlbHBlciBmb3IgdGhhdCBjaGVjayA/CgpZZWFoIGl0J3MgYSBiaXQgYW5ub3lp
bmcgd2hlbiBza2ItPnByb3RvY29sIGlzIG5vdCA9PSBldGhlcnR5cGUgb2YgYnVmZmVyLgoKSSBj
YW4gY2VydGFpbmx5IGFkZCBhIGhlbHBlciBzdWNoIGFzIHNrYl9ldGhfcmF3X2V0aGVydHlwZSgp
CnRvIDxsaW51eC9pZl9ldGhlci5oPiB0aGF0IHdpbGwgaW5zcGVjdCB0aGUgYWN0dWFsIGV0aGVy
dHlwZSBpbgpza2ItPmRhdGEuCgpJdCdzIHRoZSBtb3N0IHN0cmFpZ2h0LWZvcndhcmQgYXBwcm9h
Y2guCgpXZSBjb3VsZCBhbHNvIGFkZCBzb21ldGhpbmcgbGlrZSBib29sIGN1c3RvbV9ldGhlcnR5
cGU7IHRvCnN0cnVjdCBza19idWZmIGFuZCBzZXQgdGhhdCB0byB0cnVlIGlmIHRoZSB0YWdnZXIg
YWRkcyBhIGN1c3RvbQpldGhlcnR5cGUuIEJ1dCBJIGRvbid0IGtub3cgaG93IHRoZSBuZXR3b3Jr
IGRldmVsb3BlcnMgZmVlbCBhYm91dAp0aGF0LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
