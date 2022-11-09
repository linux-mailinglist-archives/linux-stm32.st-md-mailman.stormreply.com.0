Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A946231FB
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Nov 2022 19:03:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1166C6504E;
	Wed,  9 Nov 2022 18:03:04 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3699C6411D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Nov 2022 18:03:02 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id h9so27037324wrt.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Nov 2022 10:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JW3fkWgeAG3LT4kZ6rcMCrGgnOiIVlFxIYHqqCAg8qs=;
 b=lQ+SPL8FwdXmfcTzLpYYBS17369BtI2K5e3Q720yl0CpD4+sF0J2A2pXEV/F2sHJtG
 twPlu+RX4BePLR7u8nDZLB8A6ZpLn18SEpk0An51PrNdFi9kzU2aRTDm8P93tgFHe90s
 kTZzgOhaatBC/di9nY5d/kxp7Y2w2ZhA8/P4LGCuo/bc7PJF47rUT5xkLbqWBcJkx6Fa
 Y4dDjLChh1iFAlc48G2EVCXtSSHqnhsl7w1a+TBMaaMuLpNbZ2gF179z1lRCRARaeBeX
 c+ZC9mcbI+rJk4e/L+Tm1UlL8CV8tfp46VSY8BsZNMDwvVWnPoMCPK7tM4+47SNJ/t0N
 GMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JW3fkWgeAG3LT4kZ6rcMCrGgnOiIVlFxIYHqqCAg8qs=;
 b=gTtob3TSHfU11jdK9xPxnq40GzmnkA81vVvFw95B8iiz48hkMzTxp1DsZZJph1QftA
 IWhu/mgOGMuAkzCoEFIfElRBwSkZ20H50NaYyuRjPXgY1TPLyVD8hKGK8dNWShOWEjGi
 uAQzi++wJmIteC9BMQm7c2BYCjlFN95pGTRN3WJpSW6pskL+VZjOPesahl2mtGU0xusF
 b0OdL19Y89L5OyhyQ1yAFuUi4IdH0eRvIl9Rm1zajKr9ZDjtZVJZTOcJuD1ANqHUIQmE
 EKgqglSyS9i+M/Rylb4aDasFcGlUgOpuoaIGjOJloa6Ula01lwpsrSJcIs0FVsWKJV4M
 HnsA==
X-Gm-Message-State: ACrzQf3uHazDt9XtPttbWmiOhHdNqaDnLIG/izlnYz2r1yAdL08rtOmz
 NP8HhrCaTQMPRGWBCxA9ux8Yfg==
X-Google-Smtp-Source: AMsMyM6SeXTYaN56/vVPHIrwx/UP6BpPLjNPyIdTSjxe/Rs+selrIt/kcFmP7DR2igBjtS13ycWK4A==
X-Received: by 2002:a5d:68ce:0:b0:236:9981:d216 with SMTP id
 p14-20020a5d68ce000000b002369981d216mr38881975wrw.384.1668016982241; 
 Wed, 09 Nov 2022 10:03:02 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 m2-20020a056000008200b0023662d97130sm13563050wrx.20.2022.11.09.10.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 10:03:01 -0800 (PST)
Message-ID: <52fa1899-6eb9-389f-2ff1-22164356df66@linaro.org>
Date: Wed, 9 Nov 2022 18:02:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20221028145252.2115933-1-patrick.delaunay@foss.st.com>
 <20221028165150.3.Ibc43aa73f865090affeb1751af0cc260c7f1dd07@changeid>
 <99a8d093-13f3-9ff8-6d87-d4aecaec1566@linaro.org>
 <a4ae3648-2943-55e0-243f-71a3c5f71ad8@foss.st.com>
 <4789703d-0434-2e72-0001-5a7e1014f816@linaro.org>
 <6df7b823-463b-d6fa-9662-54f39463a894@foss.st.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <6df7b823-463b-d6fa-9662-54f39463a894@foss.st.com>
Cc: Etienne CARRIERE <etienne.carriere@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 3/3] nvmem: stm32: add OP-TEE support for
	STM32MP13x
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAwOS8xMS8yMDIyIDE3OjM1LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+Pj4KPj4+Cj4+
Pj4KPj4+PiBXaHkgbm90IGFkZCBURUUgY2xpZW50IGJhc2VkIG5ldyBkcml2ZXIgaW5zdGVhZCBv
ZiBpZmRlZmluZyBhcm91bmQgCj4+Pj4gdGhpcyBkcml2ZXI/IEFsc28gSSBzZWUgdGhlcmUgaXMg
bm90IG11Y2ggY29tbW9uIGFjcm9zcyBib3RoIGRyaXZlcnMgCj4+Pj4gYW55d2F5Lgo+Pj4KPj4+
Cj4+PiBJIGhlc2l0YXRlIGJldHdlZW4gdGhlIDIgc29sdXRpb25zLiBJIGNob29zZSB0aGlzIHVw
ZGF0ZSB0byBoYW5kbGUgCj4+PiB0aGUgU1RNMzJNUDE1IHN1cHBvcnQgd2l0aCBPUC1URUUuCj4+
Cj4+IEhvdyBhcmUgeW91IHRvIGhhbmRpbmcgdGhpcz8KPj4KPj4+Cj4+PiBGb3IgYmFja3dhcmQg
Y29tcGF0aWJpbGl0eSByZWFzb24gdGhlIHNhbWUgZHJpdmVyIFNUTTMyIFJPTUVNIAo+Pj4gYXNz
b2NpYXRlZCB0byBjb21wYXRpYmxlICJzdCxzdG0zMm1wMTUtYnNlYyIgc2hvdWxkIGJlIGtlcHQu
Cj4+Pgo+Pj4gLSB0aGUgbG93ZXIgT1RQIGNhbiBkaXJlY3RseSBhY2Nlc3NpYmxlIGJ5IExpbnV4
ICh0aGUgSVAgaXMgbm90IAo+Pj4gc2VjdXJlZCkgPT4gYm9vdCB3aXRoIFNQTAo+Pgo+PiBDYW4g
d2UgZGV0ZXJtaW5lIHRoaXMgYXQgcnVudGltZT8KPiAKPiAKPiBOb3QgZGlyZWN0bHkgd2l0aCBJ
UCByZWdpc3RlciwgYnV0IHdlIGRldGVjdCB0aGUgT1AtVEVFIHN1cHBvcnQgYXQgcnVudGltZS4K
PiAKWW91IG1lYW4gdXNpbmcgQ09ORklHX09QX1RFRSA/CgoKPiAKPj4KPj4+Cj4+PiAtIHRoZSB1
cHBlciBPVFAgYW5kIHRoZSB3cml0ZSBvcGVyYXRpb24gYXJlIHJlcXVlc3RlZCBieSAKPj4+IFNU
TWljcm9lbGVjdHJvbmljcyBTTUNzCj4+Pgo+Pj4gwqDCoMKgID0+IGJvb3Qgd2l0aCBURi1BIFNQ
TUlOIGFuZCBvbGQgT1AtVEVFIChiZWZvcmUgbWlncmF0aW9uIHRvIFNUTTMyIAo+Pj4gQlNFQyBQ
VEEpCj4+Pgo+Pj4KPj4+IEJ1dCBpbiB0aGUgZnV0dXJlIE9QLVRFRSB0aGUgYWNjZXNzIHRvIE9U
UCBzaG91bGQgYmUgYWxzbyBkb25lIHdpdGggCj4+PiBTVE0zMiBCU0VDIFBUQS4uLgo+Pgo+PiBH
aXZlbiB0aGF0IHdlIGhhdmUgb25seSBvbmUgY29tcGF0aWJsZSBmb3IgdGhlc2UgdHdvIHR5cGUg
b2YgCj4+IGNvbWJpbmF0aW9ucyBob3cgYXJlIHlvdSBwbGFubmluZyB0byBkZWFsIHdpdGggYm90
aCB0aGUgY2FzZXMgYW5kIAo+PiBzdGlsbCBiZSBiYWNrd2FyZCBjb21wYXRpYmxlPwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
