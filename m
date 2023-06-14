Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C23B72F64A
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 09:29:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1413EC6A61A;
	Wed, 14 Jun 2023 07:29:02 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55AF9C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 07:29:00 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-43dd7791396so793089137.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 00:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686727739; x=1689319739;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CRRGmdvDVbIEVTAFye64zUK3XOXIsv8ssMpfcABwlc=;
 b=Nf0/wLoZ38LsOopYbyo0ezI8LUQxgJTAFLkmLtgB++4Cqtqg95I3NTpGl9TXnYDDkY
 wQhNpaGtN+5iKwyxA/Sc3yKL4QWEEoRYv1tUv0/rZ1jPqpc9h2liqXzIFsH7Mk0PzJ2D
 8Dt9l/8xaaR/qGP/pxdKD42jgFfMPgpFD59+6wt7ykOg3xU4OOQOIVjAB7xnsarGe2xV
 S1QJ6zDt5NlO/4rFM4tBxEctZeiRwHUUbqReFG2sT+6YQbOdFDmCmmmOhAPgpwdAefLP
 SOVujR+y+Jx1AZxSFRB5PTZR3D5aXGCdsLrtMDajNAzKERlzusmNmNlP39Tdtw7fIp0C
 Jqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686727739; x=1689319739;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CRRGmdvDVbIEVTAFye64zUK3XOXIsv8ssMpfcABwlc=;
 b=gdsHknwVXqoPBqY7AvSE6rZTaGcyKf8Puggc+yMQKhwwuHIVL1jQTpyGo7ZOvwIPBc
 fq7Zg3zpNPfM2GA4JIeSGx4HCV4YkWAZQXnSJDkulsKlY2TvnYsdSypR1pzxyOPitsqM
 er0rIQQIs6bbpfwVQym2ULq4PLtXJbaEJAPG7j8ZUV/XUAvwDUm/NWtRH8X2rFQObvCY
 nCevQMCHnokDmPKQdKeAqKeHcm/4YAKLLmwJAN/DcCGpbhHOirHEwFCrHqWIzXSjyrpR
 MSyl+TvetDX8nt6wnYiZrTOR66yl28FsERGTNFMlMBP2cQeFOA/KW2Pxa6j2J0FTjgJG
 tacg==
X-Gm-Message-State: AC+VfDzENlW27iHrOEVslQwhk2KeR2InTTJwVwDsD8Ahdr5iHwAKueKF
 F9qSR2Y3Ocbw9i5bTF+1lx0c+rcNl3PXc/EHoK+Zfg==
X-Google-Smtp-Source: ACHHUZ5IOUv06tiZXv2OeC2IVs2JPsy0d5AliyorYz0hKnjFQVcPktvrX5L1vFgxFRciusLts8S8bofr4NgaMAhMxQo=
X-Received: by 2002:a05:6102:ca:b0:43d:54e9:35fb with SMTP id
 u10-20020a05610200ca00b0043d54e935fbmr7796848vsp.14.1686727739229; Wed, 14
 Jun 2023 00:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-21-brgl@bgdev.pl>
 <712b2650-f0c1-088a-612c-ef6d6bcc1eb0@linaro.org>
In-Reply-To: <712b2650-f0c1-088a-612c-ef6d6bcc1eb0@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Jun 2023 09:28:48 +0200
Message-ID: <CAMRc=McvVwk_HGU_cRzJ_qsCriHKfq61qL7bbe10evr-Sp6YSA@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 20/26] dt-bindings: net: qcom,
	ethqos: add description for sa8775p
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

T24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgOToyNeKAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAxMi8wNi8yMDIzIDEx
OjIzLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IEFkZCB0aGUgY29t
cGF0aWJsZSBmb3IgdGhlIE1BQyBjb250cm9sbGVyIG9uIHNhODc3NXAgcGxhdGZvcm1zLiBUaGlz
IE1BQwo+ID4gd29ya3Mgd2l0aCBhIHNpbmdsZSBpbnRlcnJ1cHQgc28gYWRkIG1pbkl0ZW1zIHRv
IHRoZSBpbnRlcnJ1cHRzIHByb3BlcnR5Lgo+ID4gVGhlIGZvdXJ0aCBjbG9jaydzIG5hbWUgaXMg
ZGlmZmVyZW50IGhlcmUgc28gY2hhbmdlIGl0LiBFbmFibGUgcmVsZXZhbnQKPiA+IFBIWSBwcm9w
ZXJ0aWVzLgo+ID4KPgo+IEkgdGhpbmsgdGhlIHBhdGNoIHNob3VsZCBiZSBzcXVhc2hlZCB3aXRo
IHByZXZpb3VzLiBBZGRpbmcgY29tcGF0aWJsZSB0bwo+IGNvbW1vbiBzbnBzLGR3bWFjIGJpbmRp
bmcgZG9lcyBub3QgbWFrZSBzZW5zZSBvbiBpdHMgb3duLiBJdCBtYWtlcyBzZW5zZQo+IHdpdGgg
YWRkaW5nIGNvbXBhdGlibGUgaGVyZS4KPgo+ID4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xh
c3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4gLS0tCj4gPiAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3Fjb20sZXRocW9zLnlhbWwgICAgICAgfCAxNCArKysr
KysrKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9uZXQvcWNvbSxldGhxb3MueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9uZXQvcWNvbSxldGhxb3MueWFtbAo+ID4gaW5kZXggNjBhMzgwNDRmYjE5Li5iMjA4NDdj
Mjc1Y2UgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bmV0L3Fjb20sZXRocW9zLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9uZXQvcWNvbSxldGhxb3MueWFtbAo+ID4gQEAgLTIwLDYgKzIwLDcgQEAgcHJvcGVy
dGllczoKPiA+ICAgIGNvbXBhdGlibGU6Cj4gPiAgICAgIGVudW06Cj4gPiAgICAgICAgLSBxY29t
LHFjczQwNC1ldGhxb3MKPiA+ICsgICAgICAtIHFjb20sc2E4Nzc1cC1ldGhxb3MKPiA+ICAgICAg
ICAtIHFjb20sc2M4MjgweHAtZXRocW9zCj4gPiAgICAgICAgLSBxY29tLHNtODE1MC1ldGhxb3MK
PiA+Cj4gPiBAQCAtMzIsMTEgKzMzLDEzIEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgLSBjb25z
dDogcmdtaWkKPiA+Cj4gPiAgICBpbnRlcnJ1cHRzOgo+ID4gKyAgICBtaW5JdGVtczogMQo+ID4g
ICAgICBpdGVtczoKPiA+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBDb21iaW5lZCBzaWduYWwgZm9y
IHZhcmlvdXMgaW50ZXJydXB0IGV2ZW50cwo+ID4gICAgICAgIC0gZGVzY3JpcHRpb246IFRoZSBp
bnRlcnJ1cHQgdGhhdCBvY2N1cnMgd2hlbiBSeCBleGl0cyB0aGUgTFBJIHN0YXRlCj4gPgo+ID4g
ICAgaW50ZXJydXB0LW5hbWVzOgo+ID4gKyAgICBtaW5JdGVtczogMQo+ID4gICAgICBpdGVtczoK
PiA+ICAgICAgICAtIGNvbnN0OiBtYWNpcnEKPiA+ICAgICAgICAtIGNvbnN0OiBldGhfbHBpCj4g
PiBAQCAtNDksMTEgKzUyLDIwIEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgLSBjb25zdDogc3Rt
bWFjZXRoCj4gPiAgICAgICAgLSBjb25zdDogcGNsawo+ID4gICAgICAgIC0gY29uc3Q6IHB0cF9y
ZWYKPiA+IC0gICAgICAtIGNvbnN0OiByZ21paQo+ID4gKyAgICAgIC0gZW51bToKPiA+ICsgICAg
ICAgICAgLSByZ21paQo+ID4gKyAgICAgICAgICAtIHBoeWF1eAo+ID4KPiA+ICAgIGlvbW11czoK
PiA+ICAgICAgbWF4SXRlbXM6IDEKPiA+Cj4gPiArICBwaHlzOiB0cnVlCj4gPiArCj4gPiArICBw
aHktc3VwcGx5OiB0cnVlCj4KPiBJc24ndCB0aGlzIHByb3BlcnR5IG9mIHRoZSBwaHk/Cj4KCkl0
IGlzLCBhbmQgYXMgZGlzY3Vzc2VkIGVsc2V3aGVyZSB3aXRoIEFuZHJldywgSSB3aWxsIG1vdmUg
aXQgdG8gdGhlClNlckRlcyBQSFkgZHJpdmVyLgoKQmFydAoKPiA+ICsKPiA+ICsgIHBoeS1uYW1l
czoKPiA+ICsgICAgY29uc3Q6IHNlcmRlcwo+Cj4gS2VlcCB0aGUgcGh5LW5hbWVzIGFmdGVyIHBo
eXMuCj4KPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
