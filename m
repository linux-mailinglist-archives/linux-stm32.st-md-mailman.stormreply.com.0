Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F4E6566A
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jul 2019 14:12:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DD6AD23083
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jul 2019 12:12:42 +0000 (UTC)
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
 [209.85.161.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D6B6D23081
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2019 12:12:40 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id q128so3172252ywc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2019 05:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JLpZTDyH6Q/WVfB7D3ohVeoj0U2p4Tl2uxiI/qIEuhc=;
 b=EfH6sWliBwbfu8sqP4opjoREUcenXWr13a17h77Bpj68HtnncvSRktKCJdngvBVDGj
 iQx8/rI+Ht34P/XquSJHbApJUdh/UZEkkZEz6DXXyvlFkxrKzcbRGI11PUWT4qaM5eeY
 RplKIYBYyVnToeLtjPy3d7F1sWPNJA7VDNZTfUw9nlEj/xUpi1Mzv19F2vrUPMFbxpiZ
 1v0pI61zsb31WW2gsjIrMIAhYnAM3rAFhzTNgZnEKm2OShiMCPC/5+n9YVP7gjT/fXCp
 9XvWqs7A+pS5OONot6+lyJ8pIxT6uzZFhhl2voygxFNNN5eSCQm/I10uk6fgYHZtUFc2
 mG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JLpZTDyH6Q/WVfB7D3ohVeoj0U2p4Tl2uxiI/qIEuhc=;
 b=e7jZIO7X+HdMo/TCxNXtWv/3oIkaK9hvbqRRZEVrk4iJV81QiBbjmeYDFfslYUGpo0
 bQzrIUKXQI8TQdwwHAztGySzdSpk+0ZI3NlAh0I2YpKBMBNwAQP+oSEF+h7qI8NLKlPH
 VlBYlqyEDNSoTAq/PPKyBy8xx1oBKeoTMd1AYnW79418kUsb7lRjiVP6M7JbdKACiGE4
 ROFOdMOMS8O3WaclSNOGhnWi44/LgQcaRdYpmZ7uFkS3XIWgbl1h3lTh2vqp2xfj3E9j
 dVMeHDFrjVd2mVtxsV00Y+rwGjTkryLgrIDTpmmqjk5VGskXeUu47CgkWozUZsk7vJLe
 8mBA==
X-Gm-Message-State: APjAAAWdtGX9zVIfF9VeBOYB4bBKEg0jm+Y5eeeBj64hCDXEQ3LujiTk
 p9Jc3DMZowvprzzsd9fy9eIrGCn6b+mxnoWWSgV0Xg==
X-Google-Smtp-Source: APXvYqzGVBbdyzATQFuVMW3IFDJn0oZE3752K4RBlif7yTSyE6BtlJCKiTmlzKVDg38zAYQuNx/xDs549BoClqzTLhQ=
X-Received: by 2002:aed:3f47:: with SMTP id q7mr1946820qtf.209.1562847159155; 
 Thu, 11 Jul 2019 05:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190507091224.17781-1-benjamin.gaignard@st.com>
 <20190711115059.GA7778@icarus>
In-Reply-To: <20190711115059.GA7778@icarus>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 11 Jul 2019 14:12:27 +0200
Message-ID: <CA+M3ks42Whd=QVQ-4==n5bRJKEwYpQtRHs=gBGEZ_Hr=_8YU1g@mail.gmail.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] IIO: stm32: Remove quadrature related
 functions from trigger driver
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

TGUgamV1LiAxMSBqdWlsLiAyMDE5IMOgIDEzOjUxLCBXaWxsaWFtIEJyZWF0aGl0dCBHcmF5Cjx2
aWxoZWxtLmdyYXlAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBUdWUsIE1heSAwNywgMjAx
OSBhdCAxMToxMjoyNEFNICswMjAwLCBCZW5qYW1pbiBHYWlnbmFyZCB3cm90ZToKPiA+IFF1YWRy
YXR1cmUgZmVhdHVyZSBpcyBub3cgaG9zdGVkIG9uIGl0IG93biBmcmFtZXdvcmsuCj4gPiBSZW1v
dmUgcXVhZHJhdHVyZSByZWxhdGVkIGNvZGUgZnJvbSBzdG0zMi10cmlnZ2VyIGRyaXZlciB0byBh
dm9pZAo+ID4gY29kZSBkdXBsaWNhdGlvbiBhbmQgc2ltcGxpZnkgdGhlIEFCSS4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29t
Pgo+Cj4gV2hhdCBpcyB0aGUgc3RhdHVzIG9mIHRoaXMgcGF0Y2g/IEFyZSB0aGVyZSBhbnkgb2Jq
ZWN0aW9ucyBjdXJyZW50bHkgZm9yCj4gaXRzIGluY2x1c2lvbj8KCllvdSB3ZXJlIHRoZSBvbmx5
IG9uZSBhc2tpbmcgZm9yIG1vcmUgZGV0YWlscyBhYm91dCBpdCA6LSkKSWYgeW91IGFncmVlIEkg
dGhpbmsgdGhhdCBKb25hdGhhbiBjYW4gbWVyZ2UgaXQuCgpCZW5qYW1pbgo+Cj4gV2lsbGlhbSBC
cmVhdGhpdHQgR3JheQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
