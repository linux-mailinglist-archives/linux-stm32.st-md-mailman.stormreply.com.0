Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8763093DA03
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jul 2024 22:50:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 411CEC78018;
	Fri, 26 Jul 2024 20:50:38 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3349DC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 20:50:31 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52f008aa351so2480261e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 13:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722027030; x=1722631830;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sW23BR/or2MMuYF31lJOR7RMa4C6ZEhZGo6Oj9/Pb3Q=;
 b=h6H4hQzZvVNgZ0v+bRFyvSUKtxJ214cGy5R2/EZ6wvFun5u47lDfewl4wPDMa+HtcB
 NFRwvokFsKZhwwrPKIuJGB/21F+qoMJmGo9/nt3qmWvQCFYCNY7w25nWJi8PD7Bz1QuU
 MVSdEvfWnm+bjQ4vSDwKFVOaNSSmFxz8/OX+VXswkTFQDSEGzo01J08nxH7EILoz7hfh
 l/B89O6UvLWx6+n3jqJRL6mI3/87PX2ciKDO9rNrp8R8P2+1Ow6LKSvedjlT6lcH1CIb
 HKNuvKV17lZiMCisRqHGJYUnd8dULPTj7H8Gpcto7X/OXlVvkuF0uaLApbAXYZQF4RcK
 62XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722027030; x=1722631830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sW23BR/or2MMuYF31lJOR7RMa4C6ZEhZGo6Oj9/Pb3Q=;
 b=iZxSHwYTgIQq4/IV9gpzPYsLkPIQAbN0KbvIwKWEX7MFNana4pnCVdfMIB6PNQB8Vm
 tY2xrJo7JcCMolHDflOdFybOgfK8C3XSJyNGjkKfnPFAI6uJ3I53YmWgWjTBPSXCMQN3
 behSuPd5dO7HFggEsdoVI2YkosH/+WYVbdfeJ9CY+JLatx/melCXV5DfSwJSovcwc02P
 DaVpxBJp6QxHnLptx9QeUps39/gexS4eQR9hixk4paVz/OrVte5U2TRu8hU7ly1vsAOo
 GS3EjR9y78kPDKrhvV4hpxB7aW120RLdLYPNAMIVRiySaDA3Dk6tSJG87fSgXZj9IfSW
 V8gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuy+n8LLropdv4AlRsAYG0OocYfAUgGKbmVHlhbpFDJU06qTAfUB0QrS3e7mX8sXz1p67OKaOneovv/V05dtXLjJ6z13azbn0nORvVlZ+cVOtgoavDfNzJ
X-Gm-Message-State: AOJu0Yw9ib7bjd7tq9972sHujdeSwKMJKWmbnBaeSAdGgfwPqNpq/159
 Mwt9q5raDwr/sZm2vGSKHKrvRVwtBdzM930H5QK6bQkKLBwP+siY0Bvs2vxP6AIAwc2Gw+pAfHD
 aJc40nNuEiQavhLgH5Kd5rUmhofAgk5cJemGuWw==
X-Google-Smtp-Source: AGHT+IFX49EtxpZmo3lCBvR7LAjeTkZmE2Z3kScGsck8eI7LPC1PBQoOA3czp83TviYDk42LHWvS4Ey6OgvmOSAZBX8=
X-Received: by 2002:a05:6512:32b6:b0:52e:9762:2ba4 with SMTP id
 2adb3069b0e04-5309b274931mr464874e87.25.1722027030326; Fri, 26 Jul 2024
 13:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240722160022.454226-1-valentin.caron@foss.st.com>
 <20240722160022.454226-4-valentin.caron@foss.st.com>
In-Reply-To: <20240722160022.454226-4-valentin.caron@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Jul 2024 22:50:19 +0200
Message-ID: <CACRpkdZTntS7K4aLqoXKbfdO2xumx9nLnA7CXysuYML=ptTCzQ@mail.gmail.com>
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/4] rtc: stm32: add Low Speed Clock
	Output (LSCO) support
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

SGkgVmFsZW50aW4sCgpPbiBNb24sIEp1bCAyMiwgMjAyNCBhdCA2OjAy4oCvUE0gVmFsZW50aW4g
Q2Fyb24KPHZhbGVudGluLmNhcm9uQGZvc3Muc3QuY29tPiB3cm90ZToKCj4gUlRDIGlzIGFibGUg
dG8gb3V0cHV0IG9uIGEgcGluIHRoZSAiTFNFIiBpbnRlcm5hbCBjbG9jay4KPgo+IFNUTTMyIFJU
QyBpcyBub3cgcmVnaXN0ZXJlZCBhcyBhIGNsb2NrIHByb3ZpZGVyLgo+IEl0IHByb3ZpZGVzIHJ0
Y19sc2NvIGNsb2NrLCB0aGF0IG1lYW5zIFJUQ19MU0NPIGlzIG91dHB1dCBvbiBlaXRoZXIKPiBS
VENfT1VUMSBvciBSVENfT1VUMl9STVAsIGRlcGVuZGluZyBvbiBwaW5tdXggRFQgcHJvcGVydHku
Cj4gVGhlIGNsb2NrIGlzIG1hcmtlZCBhcyBDTEtfSUdOT1JFX1VOVVNFRCBhbmQgQ0xLX0lTX0NS
SVRJQ0FMIGJlY2F1c2UKPiBSVENfTFNDTyBjYW4gYmUgZWFybHkgcmVxdWlyZWQgYnkgZGV2aWNl
cyBuZWVkZWQgaXQgdG8gaW5pdC4KPgo+IEFkZCBMU0NPIGluIHBpbm11eCBmdW5jdGlvbnMuCj4K
PiBBZGQgInN0bTMyX3J0Y19jbGVhbl9vdXRzIiB0byBkaXNhYmxlIExTQ08uIEFzIFJUQyBpcyBw
YXJ0IG9mICJiYWNrdXAiCj4gcG93ZXIgZG9tYWluLCBpdCBpcyBub3QgcmVzZXQgZHVyaW5nIHNo
dXRkb3duIG9yIHJlYm9vdC4gU28gZm9yY2UgTFNDTwo+IGRpc2FibGUgYXQgcHJvYmUuCj4KPiBD
by1kZXZlbG9wZWQtYnk6IEFtZWxpZSBEZWxhdW5heSA8YW1lbGllLmRlbGF1bmF5QGZvc3Muc3Qu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IEFtZWxpZSBEZWxhdW5heSA8YW1lbGllLmRlbGF1bmF5QGZv
c3Muc3QuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFZhbGVudGluIENhcm9uIDx2YWxlbnRpbi5jYXJv
bkBmb3NzLnN0LmNvbT4KKC4uLikKCj4gQEAgLTE5MjgsNiArMTkyOCw3IEBAIGNvbmZpZyBSVENf
RFJWX1NUTTMyCj4gICAgICAgICBzZWxlY3QgUElOTVVYCj4gICAgICAgICBzZWxlY3QgUElOQ09O
Rgo+ICAgICAgICAgc2VsZWN0IEdFTkVSSUNfUElOQ09ORgo+ICsgICAgICAgZGVwZW5kcyBvbiBD
T01NT05fQ0xLCgpKdXN0CnNlbGVjdCBDT01NT05fQ0xLCgpXaHkgbm90LCBpdCB3aWxsIHdpdGgg
MTAwJSBjZXJ0YWludHkgYmUgbmVlZGVkIGFueXdheSBieSB0aGUgc3lzdGVtCmNsb2NrIGNvbnRy
b2xsZXIuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
