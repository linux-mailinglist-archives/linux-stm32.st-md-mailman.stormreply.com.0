Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6179BBB7C
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E277C7A832;
	Mon,  4 Nov 2024 17:18:39 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AF16C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 09:04:50 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e28fc8affdaso98829276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 02:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730365489; x=1730970289;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ey3Nir80ipbi6aEqJTmKEXKmtI3cKgTNpdgc0Wv4xOA=;
 b=DpAedTGMeo0iBTUpaRkJlKYxHC2429io28pTCPEBrARAfzR0wV8XxTV4tJP3Sh5WrC
 XVbLC5Fs55dNG+rHGx/P4+xqIuozqNKWDlER7zqZ6kodmGfKE76B5FZ7862EE+YjvStu
 y7rtsGArphAG/gbLg9z+2pqCfDWZnAcSux8zfhg1sIAsZ1+8CRNteRfkBQ77IZArq6/l
 zD+YhOpyvzzk5Zpyc/MjehndDEZXJtsSvZGv0m6SwlFc1R9saR/TUefVyzXaZI8cceZS
 3dCplWB09N2KdN/c008bLOy5jXgx/fwI7W0VSiOcGw2PE+8LFX4m4BGcwmdI6JTRq1Ut
 FSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730365489; x=1730970289;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ey3Nir80ipbi6aEqJTmKEXKmtI3cKgTNpdgc0Wv4xOA=;
 b=huARHflWhR0Ww0TvStgYg7jTepdkpA084hrEvkHkKvpddxdTYtc/3YDm8Cs2Wd6o7z
 RHyMaU9bSXtCg2wsTe0qEFTks4cyGYG+pdbIJ/rUC0B8TWihF4+beJWwhLNNWWPCaw1t
 bTIFzayNwUpsHJf0WaZiDRnIqtN4yZPeBRTzR+kyGtcdXaUWLbL7kju//PU+9qloui1s
 KD3GZdmeRI9aMwT73MH7gmWIr/2iB/ifMGKpDsKIuxv5mzVH2HmYeM1OcVdVgBrjKI0K
 aFCXNr3n+k6sjoDESLouUm1anTN/1gbNt5VuP1b3Xkl4Wd21SiFZLzL5xTF/116kwgYI
 HsEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW21AeG1ApyVl4/UHVOyAjKOXBi5+5tnN+tmrjY2VDCzpVnnuFv2ZMQj6V3zKSUJJRv84OVFZjGbsIa8w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxeKXETANvcCk0LWjVHLNrFIEwWuPUreXlASPTGjdniw6VIZHEx
 taJ26VoIN4LxrcZn9EOa4SX/wgR+tzp4BfpCT886ZJApeqTIVIt+aQByj5N/IcMWaFeDeUYvzjC
 1V/MxBycnQELQX9jNa8qlgsstwmc=
X-Google-Smtp-Source: AGHT+IHZguKS/F1V9AJj+A9lEBmF80qUzVmVIz8k06olAGMVP1Gm5twS6Ahy8M35orW4qXtccoTRMk9rczRRsmL94jQ=
X-Received: by 2002:a05:690c:ed4:b0:627:a25d:6e76 with SMTP id
 00721157ae682-6e9d88e7719mr79156307b3.2.1730365489324; Thu, 31 Oct 2024
 02:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20241029202349.69442-1-l.rubusch@gmail.com>
 <173030774932.1269076.14582772234717243392.robh@kernel.org>
In-Reply-To: <173030774932.1269076.14582772234717243392.robh@kernel.org>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Thu, 31 Oct 2024 10:04:12 +0100
Message-ID: <CAFXKEHaUO=Xo9iGYfUbadQPbi1Sepv=GODoRabQ9qP5PC-MRpw@mail.gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dinguyen@kernel.org, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 krzk+dt@kernel.org, s.trumtrar@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 00/23] Add Enclustra Arria10 and
	Cyclone5 SoMs
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

T24gV2VkLCBPY3QgMzAsIDIwMjQgYXQgNjowNOKAr1BNIFJvYiBIZXJyaW5nIChBcm0pIDxyb2Jo
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4KPiBPbiBUdWUsIDI5IE9jdCAyMDI0IDIwOjIzOjI2ICsw
MDAwLCBMb3RoYXIgUnVidXNjaCB3cm90ZToKPiA+IEFkZCBkZXZpY2UtdHJlZSBzdXBwb3J0IGZv
ciB0aGUgZm9sbG93aW5nIFNvTXM6Cj4gPgo+ID4gLSBNZXJjdXJ5IFNBMSAoY3ljbG9uZTUpCj4g
PiAtIE1lcmN1cnkrIFNBMiAoY3ljbG9uZTUpCj4gPiAtIE1lcmN1cnkrIEFBMSAoYXJyaWExMCkK
PiA+ClsuLi5dCj4gTXkgYm90IGZvdW5kIG5ldyBEVEIgd2FybmluZ3Mgb24gdGhlIC5kdHMgZmls
ZXMgYWRkZWQgb3IgY2hhbmdlZCBpbiB0aGlzCj4gc2VyaWVzLgo+Cj4gU29tZSB3YXJuaW5ncyBt
YXkgYmUgZnJvbSBhbiBleGlzdGluZyBTb0MgLmR0c2kuIE9yIHBlcmhhcHMgdGhlIHdhcm5pbmdz
Cj4gYXJlIGZpeGVkIGJ5IGFub3RoZXIgc2VyaWVzLiBVbHRpbWF0ZWx5LCBpdCBpcyB1cCB0byB0
aGUgcGxhdGZvcm0KPiBtYWludGFpbmVyIHdoZXRoZXIgdGhlc2Ugd2FybmluZ3MgYXJlIGFjY2Vw
dGFibGUgb3Igbm90LiBObyBuZWVkIHRvIHJlcGx5Cj4gdW5sZXNzIHRoZSBwbGF0Zm9ybSBtYWlu
dGFpbmVyIGhhcyBjb21tZW50cy4KClthbnN3ZXJpbmcgdG8gdGhpcyBib3RdCk5vbmUgb2YgdGhl
ICJwbGF0Zm9ybSBtYWludGFpbmVycyIgZ2F2ZSBtZSBmZWVkYmFjayBzbyBmYXIuIE15CmludGVu
dGlvbiBpcyBqdXN0IHRvIHVwc3RyZWFtIHRoZSBtZW50aW9uZWQgLmR0cyBhbmQgLmR0c2kgZmls
ZXMuIEkKY2hlY2tlZCBteSBmaWxlcyBhbmQgZml4ZWQgbXkgb2J2aW91cyBiaW5kaW5ncyBtaXN0
YWtlcy4KCkJ1dCwgYmluZGluZ3MgZm9yIHBsYXRmb3JtIHNvY2ZwZ2EgYXJlIHN0aWxsIGRlc2Ny
aWJlZCBpbiAob2xkKSBUWFQKZmlsZXMsIG5vdCBpbiBZQU1MLiBTbywgZG8geW91IHdhbnQgbWUg
dG8gd3JpdGUgdGhlIC55YW1sIGZpbGVzLCB0b28/Ck9yLCBhcmUgbXkgZmlsZXMgYWNjZXB0YWJs
ZSBieSAidGhlIHBsYXRmb3JtIG1haW50YWluZXIiPyBXaGF0IGlzCm1pc3NpbmcgaGVyZT8gU2hv
dWxkIEkgdHJ5IHRvIGZpeCBldmVyeSBlcnJvciBvZiBSb2IncyBib3Q/IEFyZSB0aGUKYm9hcmRz
IC8gaXMgdGhlIHBsYXRmb3JtIHRvbyBvbGQgYW5kIHlvdSBkb24ndCB3YW50IHRoZW0gYW55bW9y
ZT8gSSdtCm5vdCBjb21wbGFpbmluZyBoZXJlLCBJIG1heSB0cnksIGJ1dCBJIHdvdWxkIGxpa2Ug
dG8ga25vdyB3aGF0J3MKbWlzc2luZy4KClBsZWFzZSwgLSBSb2IsIENvbm5vciBvciBLcnp5c3p0
b2YgLSBjYW4geW91IGdpdmUgbWUgZmVlZGJhY2sgYW5kIHRlbGwKbWUgd2hhdCB5b3UgZ3V5cyBl
eHBlY3QgbWUgdG8gZG8gbm93IGhlcmU/IFRoYW5rcyBpbiBhZHZhbmNlIQoKPiBJZiB5b3UgYWxy
ZWFkeSByYW4gRFQgY2hlY2tzIGFuZCBkaWRuJ3Qgc2VlIHRoZXNlIGVycm9yKHMpLCB0aGVuClsu
Li5dCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
