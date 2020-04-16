Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6441ABB8B
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 10:45:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB498C36B0C;
	Thu, 16 Apr 2020 08:45:52 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2901C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 08:45:51 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b11so3827580wrs.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 01:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7CCjqYtV5rZ1BPnB8xJbE2LOaBB1/4i0WAcySTW6iW4=;
 b=itp8ed87fWGbopVCacBwE3FdVL41GEKkFYSZwG2nBvg1yeGIFZDWITbHGxX+ZIc4++
 VIJYGeSbiOfjOQmSJI5J7y2+8QHmqlWFHnvdlAI1iJXxH6aJl09AvLpCHN72RC0/v73z
 rPNW/RviGMAZUAEVu+bLyRzexUY3dg/QaXeotAFdcnexqly7yj+rXOq2Cx3d0VmkOyd8
 Xv07Clm5SPK9NY+6HHuCKkw4sx/I9MwBANvuA1+yA3fE6mPbdtgxAL3obfE9Znh4IYPu
 so+60k1dtngnXw/obk3frg1N9vfu8bFB1d/nO1kEQoiDni9gxWZUEzZopQOoOVisxda9
 mwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7CCjqYtV5rZ1BPnB8xJbE2LOaBB1/4i0WAcySTW6iW4=;
 b=UcDbXWx6WYRbORk+6CHRcGGSqUxWCFOfO7ByWiqdw27ebNPhxUQx+gkw+1rztnPz7+
 e8BIknUUUkWCRIMNUKS467mUvXJ4rt/shrhrL2Rv0Spk8d7nvlXY3NqKrruIAk0Xk6ZL
 GkpxYZJrAkuQFztu4PUrxurMbitoiMvwwiazlVB5PHeIiDc7H7XvoZ/hbovyTxYQnGPX
 x0kyyMXSKvVKmqK8jMDAe+DzVBSQFlwWmu2Pxm46P0Ih1pqN0pr6B/d+EwPnu8gO8ISZ
 zOQZIq4Z+oMD2+FaIdyZpbbhk9qfYdi1k0Uv4sd4+wPTXVWczYLZRBDxNWil6rRXnixg
 hztw==
X-Gm-Message-State: AGi0PuZo2gkFSseIcDNP3TSihPQry7Hscgyk+MD1SSx8nXsH+wbkSprc
 HXVZYYN9tKr57xRVYEAQcZgNDA==
X-Google-Smtp-Source: APiQypKwaGysG2hGUewJA7EWz2Xers7oN6ox2nLU1AuZfQ6/AeW4VTV34p40rICyZXOGugtKZ8RQdw==
X-Received: by 2002:a5d:4712:: with SMTP id y18mr3148011wrq.306.1587026751319; 
 Thu, 16 Apr 2020 01:45:51 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id n11sm28218236wrg.72.2020.04.16.01.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 01:45:50 -0700 (PDT)
Date: Thu, 16 Apr 2020 09:46:51 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <20200416084651.GW2167633@dell>
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
ZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKQXBvbG9naWVzIGZv
ciBub3Qgc3BvdHRpbmcgdGhpcyBwYXRjaCBzb29uZXIsIGl0IGhhZCBzbGlwcGVkIHRocm91Z2gK
dGhlIG5ldC4gIElmIHRoaXMgaGFwcGVucyBhZ2FpbiwgcGxlYXNlIGp1c3Qgc3VibWl0IGEgW1JF
U0VORF0uCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9zdG0zMi10aW1lcnMuYyBiL2RyaXZl
cnMvbWZkL3N0bTMyLXRpbWVycy5jCj4gaW5kZXggZWZjZDRiOTgwYzk0Li5hZGQ2MDMzNTkxMjQg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZmQvc3RtMzItdGltZXJzLmMKPiArKysgYi9kcml2ZXJz
L21mZC9zdG0zMi10aW1lcnMuYwo+IEBAIC0xNjcsMTAgKzE2NywxMSBAQCBzdGF0aWMgdm9pZCBz
dG0zMl90aW1lcnNfZ2V0X2Fycl9zaXplKHN0cnVjdCBzdG0zMl90aW1lcnMgKmRkYXRhKQo+ICAJ
cmVnbWFwX3dyaXRlKGRkYXRhLT5yZWdtYXAsIFRJTV9BUlIsIDB4MCk7Cj4gIH0KPiAgCj4gLXN0
YXRpYyB2b2lkIHN0bTMyX3RpbWVyc19kbWFfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2LAo+ICtz
dGF0aWMgaW50IHN0bTMyX3RpbWVyc19kbWFfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2LAo+ICAJ
CQkJICAgc3RydWN0IHN0bTMyX3RpbWVycyAqZGRhdGEpCj4gIHsKPiAgCWludCBpOwo+ICsJaW50
IHJldCA9IDA7Cj4gIAljaGFyIG5hbWVbNF07Cj4gIAo+ICAJaW5pdF9jb21wbGV0aW9uKCZkZGF0
YS0+ZG1hLmNvbXBsZXRpb24pOwo+IEBAIC0xNzksMTQgKzE4MCwyMyBAQCBzdGF0aWMgdm9pZCBz
dG0zMl90aW1lcnNfZG1hX3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgCS8qIE9wdGlvbmFs
IERNQSBzdXBwb3J0OiBnZXQgdmFsaWQgRE1BIGNoYW5uZWwocykgb3IgTlVMTCAqLwo+ICAJZm9y
IChpID0gU1RNMzJfVElNRVJTX0RNQV9DSDE7IGkgPD0gU1RNMzJfVElNRVJTX0RNQV9DSDQ7IGkr
Kykgewo+ICAJCXNucHJpbnRmKG5hbWUsIEFSUkFZX1NJWkUobmFtZSksICJjaCUxZCIsIGkgKyAx
KTsKPiAtCQlkZGF0YS0+ZG1hLmNoYW5zW2ldID0gZG1hX3JlcXVlc3Rfc2xhdmVfY2hhbm5lbChk
ZXYsIG5hbWUpOwo+ICsJCWRkYXRhLT5kbWEuY2hhbnNbaV0gPSBkbWFfcmVxdWVzdF9jaGFuKGRl
diwgbmFtZSk7Cj4gIAl9Cj4gLQlkZGF0YS0+ZG1hLmNoYW5zW1NUTTMyX1RJTUVSU19ETUFfVVBd
ID0KPiAtCQlkbWFfcmVxdWVzdF9zbGF2ZV9jaGFubmVsKGRldiwgInVwIik7Cj4gLQlkZGF0YS0+
ZG1hLmNoYW5zW1NUTTMyX1RJTUVSU19ETUFfVFJJR10gPQo+IC0JCWRtYV9yZXF1ZXN0X3NsYXZl
X2NoYW5uZWwoZGV2LCAidHJpZyIpOwo+IC0JZGRhdGEtPmRtYS5jaGFuc1tTVE0zMl9USU1FUlNf
RE1BX0NPTV0gPQo+IC0JCWRtYV9yZXF1ZXN0X3NsYXZlX2NoYW5uZWwoZGV2LCAiY29tIik7Cj4g
KwlkZGF0YS0+ZG1hLmNoYW5zW1NUTTMyX1RJTUVSU19ETUFfVVBdID0gZG1hX3JlcXVlc3RfY2hh
bihkZXYsICJ1cCIpOwo+ICsJZGRhdGEtPmRtYS5jaGFuc1tTVE0zMl9USU1FUlNfRE1BX1RSSUdd
ID0gZG1hX3JlcXVlc3RfY2hhbihkZXYsICJ0cmlnIik7Cj4gKwlkZGF0YS0+ZG1hLmNoYW5zW1NU
TTMyX1RJTUVSU19ETUFfQ09NXSA9IGRtYV9yZXF1ZXN0X2NoYW4oZGV2LCAiY29tIik7Cj4gKwo+
ICsJZm9yIChpID0gU1RNMzJfVElNRVJTX0RNQV9DSDE7IGkgPCBTVE0zMl9USU1FUlNfTUFYX0RN
QVM7IGkrKykgewo+ICsJCWlmIChJU19FUlIoZGRhdGEtPmRtYS5jaGFuc1tpXSkpIHsKPiArCQkJ
LyogU2F2ZSB0aGUgZmlyc3QgZXJyb3IgY29kZSB0byByZXR1cm4gKi8KPiArCQkJaWYgKFBUUl9F
UlIoZGRhdGEtPmRtYS5jaGFuc1tpXSkgIT0gLUVOT0RFViAmJiAhcmV0KQo+ICsJCQkJcmV0ID0g
UFRSX0VSUihkZGF0YS0+ZG1hLmNoYW5zW2ldKTsKPiArCj4gKwkJCWRkYXRhLT5kbWEuY2hhbnNb
aV0gPSBOVUxMOwo+ICsJCX0KPiArCX0KCkluIG15IG1pbmQsIGl0IGRvZXNuJ3QgbWFrZSBzZW5z
ZSB0byBrZWVwIHJlcXVlc3RpbmcgY2hhbm5lbHMgaWYgYW4KZXJyb3IgaGFzIG9jY3VycmVkLiAg
UGxlYXNlIHJlbW92ZSBhbGwgb2YgdGhlIGFkZGVkIGNvbXBsZXhpdHkgY2F1c2VkCmJ5IHRoZSBm
b3IoKSBsb29wIGFuZCBzaW1wbHkgY2hlY2sgdGhlIHJldHVybiB2YWx1ZSBhZnRlciBlYWNoIGNh
bGwgdG8KZG1hX3JlcXVlc3RfY2hhbigpLCByZXR1cm5pbmcgaW1tZWRpYXRlbHkgb24gZXJyb3Iu
Cgo+ICsJcmV0dXJuIHJldDsKPiAgfQoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8g
U2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
