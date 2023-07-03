Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E767455C6
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jul 2023 09:13:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3D7EC6B45A;
	Mon,  3 Jul 2023 07:13:20 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32ED7C6B453
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jul 2023 07:13:20 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1b882228638so6274475ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Jul 2023 00:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688368399; x=1690960399;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3gdmjGHia+jKRSyCfrlTQ/eoeJlaZFLf9ynF3dOskcU=;
 b=NvLnU7Qf/4miEBTDIGynlVerZgG0j9kKifoHjbQVSC6ehgAanCaXlPKMu+PmHOhH/W
 hse8ugMIDG8mOC6T5lA3Avc6jFOEW5oUpK/wCWq/zbTxKP5NZUPtgS2URd0k5+6UJ49n
 LVX9JT8k+BFKqrW4xc6QH0OTb7ek9woEnDoWByxPRPaAv8TFcyf6cAq1UoF5il86lRvS
 xQNTG1stp8WLkMwMO3pG8hVHge8hJaqie7QFqgWN28/bOODImQ+0aO169hYoG+3NfPBr
 6BJmBm0a6GvpaG6lD5Wg9meRp+eLIAcBTSLIrBoI7waD8UNZ5XEyl3eg5LekT2cOoaTq
 dH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688368399; x=1690960399;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3gdmjGHia+jKRSyCfrlTQ/eoeJlaZFLf9ynF3dOskcU=;
 b=IpYWYB2MOXGqWMyQ6R0IqfeU2yzS8nuQO+itXNEv9WDl8yNkkIJYHoSMLtobkqJIgw
 VYV/doL9JYW3/PGO+Wb9yhZ/93QjsJYYmmbSDR/ApgNg1Q6a6ejIAb4CGeUAZ5FfNxSR
 Ch5b3BLmFkWundVwJ1FQCbIcYAJE+fQZP3955c7HW1mT+DCcnaWC6UMbfvmCO1/ezW2H
 E8cn9M7yULVz0n0LShOVk1vVyj9Qv+n8QqL+7oBrbzruLqY/mt3EOlVvIXuAuZZiIdb0
 rdTrTlUr8Fi7T2P1xVBuuwkrLWCZv3XyAmgf4Elnao3nRPJaw35NNlY5BzPjdFi8dEUy
 DscA==
X-Gm-Message-State: ABy/qLY+raE+uGEK21+3ATgpaPQL0RG3KIU9wrsw4Uweo74onWIwW/o9
 GQD0qtPcnjCQwZUJDp62y7nTlREjL+w3J2QC6ay2Ig==
X-Google-Smtp-Source: APBJJlH4H1LJEkNForC6tZD4lPdH33Iimwz3Zzeu94n+d3up/GqFuSavaNHzUS7dGulmfroxCq8D+yD98kWMqXzpoSw=
X-Received: by 2002:a17:902:da92:b0:1b8:525a:f685 with SMTP id
 j18-20020a170902da9200b001b8525af685mr9718943plx.37.1688368398730; Mon, 03
 Jul 2023 00:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230702103516.139440-1-rgallaispou@gmail.com>
 <11ec64ad-8fb8-e94d-2019-d3deb399084b@linaro.org>
 <4aba0e4a-87f0-1810-bf4d-a2f278e51e8b@gmail.com>
In-Reply-To: <4aba0e4a-87f0-1810-bf4d-a2f278e51e8b@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 3 Jul 2023 09:13:06 +0200
Message-ID: <CAGE=qrpE9pP4m07VT+RRLhPysF+wO690mF7ChToJYcArKm_nGg@mail.gmail.com>
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais=2DPou?= <rgallaispou@gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: st: add buswidth property to
	stm32f429-disco
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

T24gTW9uLCAzIEp1bCAyMDIzIGF0IDA1OjIxLCBSYXBoYcOrbCBHYWxsYWlzLVBvdSA8cmdhbGxh
aXNwb3VAZ21haWwuY29tPiB3cm90ZToKPiA+PiAgICAgICAgICAgICAgc3BpLTN3aXJlOwo+ID4+
ICAgICAgICAgICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDwxMDAwMDAwMD47Cj4gPj4gICAgICAg
ICAgICAgIGRjLWdwaW9zID0gPCZncGlvZCAxMyAwPjsKPiA+PiArICAgICAgICAgICAgYnVzd2lk
dGggPSA8OD47Cj4gPgo+ID4gVGhlcmUgaXMgbm8gc3VjaCBzcGkgcHJvcGVydHkuCj4KPiBXaGls
ZSBJIGFncmVlIHdpdGggeW91LCBJIHNhdyBpbiBzdGFnaW5nIGRyaXZlcnMgdGhhdCB0aGlzIHBy
b3BlcnR5IHdhcwo+IGZldGNoIGluIHRoZSBkZXZpY2UtdHJlZSBieSB0aGUgZmJ0ZnQgY29yZS4K
Pgo+IFNob3VsZCBJIGRvY3VtZW50IHRob3NlIGluIG9yIHRyeSB0byBkbyBpdCBhbm90aGVyIHdh
eSA/CgpZb3UgY2Fubm90IHVzZSB1bmRvY3VtZW50ZWQgcHJvcGVydGllcy4gV2hldGhlciB0aGlz
IHNob3VsZCBiZSB1c2VkIGF0CmFsbCwgZGVwZW5kcyB3aGF0J3MgdGhpcywgd2h5IG90aGVyIHBy
b3BlcnRpZXMgY2Fubm90IGJlIHVzZWQgZXRjLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
