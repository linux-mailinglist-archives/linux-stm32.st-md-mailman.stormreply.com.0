Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 868EE4CE11F
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Mar 2022 00:45:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50123C5F1EF;
	Fri,  4 Mar 2022 23:45:18 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43E5DC5EC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 23:45:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A7ADBB82C39
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 23:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62768C36AE3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 23:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646437515;
 bh=NeRBwotyA+2T4DJi4XwW8R9F5009UEd0x0u94q4HzSU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=F4kIJg1JBz7deNxMyZ/NWRHbYHAWiOoPzls/nqlVNxWR4XRC0AXHq9Bu8c/tdM0nt
 F/b68J2MS2rmnOFIhnh3J31DgEZgxe6h6VKEUKH1UDGlmAD+ruRiX51NkXcPnYxO53
 P38M7Rdo1D/zecUw92XgmrDTpmYDJ+bWeiZ3I4USeCvAvrNblBNMVo/bJXvvNV2M2T
 Rkn7GhSGMcgQIa76sgpyGpdKgmNMvNibCCGlw7lwJ+Y9MxIyNGSgJ/IkZbyn7j/rPd
 xopIiph9c6NMqICzJUO0XL7G8oJm+nO7ps0zP/z3AktHuIn+CoDwm9JGjBzUMey3eK
 +5qbQBJ5uWYrA==
Received: by mail-ej1-f42.google.com with SMTP id p15so20512023ejc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Mar 2022 15:45:15 -0800 (PST)
X-Gm-Message-State: AOAM532xwXJq3t4XdQqDxMSiJKcJYXIuJ7iWug+QefGdtgGFPodAYovx
 Cydac7en0bgOzS3DbpBeC8f7wGwYPCVzaso65w==
X-Google-Smtp-Source: ABdhPJxYS0br7Fg3mai1Y52kvgn22FUhmJLrfoIufPjrILVKI7waYv7yh1S/8ojIS55W4FhA8IZFUbN9+nd9WWD+qnA=
X-Received: by 2002:a17:906:b348:b0:6cf:5b66:2f80 with SMTP id
 cd8-20020a170906b34800b006cf5b662f80mr903212ejb.638.1646437513692; Fri, 04
 Mar 2022 15:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304095458.12409-3-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 5 Mar 2022 07:45:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9m06C63xXQqDSZeV2ZojEqE_Hb+V8stPc1x4oUdD5OGA@mail.gmail.com>
Message-ID: <CAAOTY_9m06C63xXQqDSZeV2ZojEqE_Hb+V8stPc1x4oUdD5OGA@mail.gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, krzysztof.kozlowski@canonical.com,
 David Airlie <airlied@linux.ie>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, CK Hu <ck.hu@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 2/3] dt-bindings: display: mediatek,
 ovl: Fix 'iommu' required property typo
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

SGksIEFuZ2VsbzoKCkFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5v
LmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+IOaWvAoyMDIy5bm0M+aciDTml6Ug6YCx5LqUIOS4i+WN
iDU6NTXlr6vpgZPvvJoKPgo+IFRoZSBwcm9wZXJ0eSBpcyBjYWxsZWQgJ2lvbW11cycgYW5kIG5v
dCAnaW9tbXUnLiBGaXggdGhpcyB0eXBvLgoKQWNrZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5r
dWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IEZpeGVzOiA0ZWQ1NDVlN2QxMDAgKCJkdC1iaW5kaW5n
czogZGlzcGxheTogbWVkaWF0ZWs6IGRpc3A6IHNwbGl0IGVhY2ggYmxvY2sgdG8gaW5kaXZpZHVh
bCB5YW1sIikKPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5n
ZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG92bC55YW1sICAgICAgfCAy
ICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLG92bC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssb3ZsLnlhbWwKPiBpbmRleCA5M2Q1YzY4YTJk
YmQuLmZjNjkxZDAwYzYwZSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxvdmwueWFtbAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG92
bC55YW1sCj4gQEAgLTc1LDcgKzc1LDcgQEAgcmVxdWlyZWQ6Cj4gICAgLSBpbnRlcnJ1cHRzCj4g
ICAgLSBwb3dlci1kb21haW5zCj4gICAgLSBjbG9ja3MKPiAtICAtIGlvbW11Cj4gKyAgLSBpb21t
dXMKPgo+ICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPgo+IC0tCj4gMi4zNS4xCj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
