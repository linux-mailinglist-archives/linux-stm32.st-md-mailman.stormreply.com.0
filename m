Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 791234CE11B
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Mar 2022 00:44:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32023C5F1EF;
	Fri,  4 Mar 2022 23:44:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B68FC5EC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 23:44:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D7DBE61EBC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 23:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C51C340F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 23:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646437439;
 bh=16b3mHxGo7CXPa/opMj9XBta1y9/zRDIU0OwsIYy1LM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lNE1FWE2VLO2AASJfC6duh+flMjHcAj1hpQGW1NHjm8rPyER1vCT/bMTz+9AcyR7i
 MpTwzcfAVei4VFMKtHZC7Ps9vRilwLDx1jNRvVhNhh1+ezFm7qN6AFK9xnsDB3CckR
 nq/xkhI1YvAHwckPcgt2NhE5m1yqtqCcNwjtSiqsfKWWZH/zaJNj8gN3aoHvgfiwG5
 LfHAo0OBP/45GsZB/4IQEvjjf+XAt0GaqfE4cneDTgx3Ed1NCEROCBOAfxfR3Tuc6Q
 xPSixbOi/gs5bGgO4hINtSbAOHIYppnlrcmpPXKWD0NxhN4Hng8NQkgpHZRx8zNgsO
 la4b07wrtmq8w==
Received: by mail-ej1-f53.google.com with SMTP id gb39so20474737ejc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Mar 2022 15:43:59 -0800 (PST)
X-Gm-Message-State: AOAM531AZbKJo5MWTsn/zVFQEFBNOJneINRYpEe5j0lNX8v43imAhdSU
 fsMvRhM23OcuVTs1guKxzoPdlTaIq+G17NsXqg==
X-Google-Smtp-Source: ABdhPJwnZliVE4KHmolx7T1uMZ0t0Ia2+Lso1v5G32G3bJxHN2JjX0zgzbElexB7kKBvJcmKTP8sZXJn0s/5C8B2wqE=
X-Received: by 2002:a17:907:3f8d:b0:6d5:bb03:c4c6 with SMTP id
 hr13-20020a1709073f8d00b006d5bb03c4c6mr953594ejc.680.1646437437567; Fri, 04
 Mar 2022 15:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304095458.12409-2-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 5 Mar 2022 07:43:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8TSQ+-LW4jRK28=G1CcwJBXYmXsgHMadaAScd7APtjNA@mail.gmail.com>
Message-ID: <CAAOTY_8TSQ+-LW4jRK28=G1CcwJBXYmXsgHMadaAScd7APtjNA@mail.gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 krzysztof.kozlowski@canonical.com, David Airlie <airlied@linux.ie>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: display: mediatek,
 mutex: Fix mediatek, gce-events type
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
iDU6NTXlr6vpgZPvvJoKPgo+IFRoZSBtZWRpYXRlayxnY2UtZXZlbnRzIHByb3BlcnR5IG5lZWRz
IGFzIHZhbHVlIGFuIGFycmF5IG9mIHVpbnQzMgo+IGNvcnJlc3BvbmRpbmcgdG8gdGhlIENNRFEg
ZXZlbnRzIHRvIGxpc3RlbiB0bywgYW5kIG5vdCBhbnkgcGhhbmRsZS4KCkFja2VkLWJ5OiBDaHVu
LUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBGaXhlczogNGVkNTQ1ZTdk
MTAwICgiZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrOiBkaXNwOiBzcGxpdCBlYWNoIGJs
b2NrIHRvIGluZGl2aWR1YWwgeWFtbCIpCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlu
byBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KPiAt
LS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxt
dXRleC55YW1sICAgIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtdXRleC55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbXV0ZXgueWFt
bAo+IGluZGV4IDZlY2E1MjVlY2VkMC4uODQyYmE3YjA3YTM0IDEwMDY0NAo+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG11
dGV4LnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxtdXRleC55YW1sCj4gQEAgLTU4LDcgKzU4LDcgQEAgcHJvcGVy
dGllczoKPiAgICAgICAgVGhlIGV2ZW50IGlkIHdoaWNoIGlzIG1hcHBpbmcgdG8gdGhlIHNwZWNp
ZmljIGhhcmR3YXJlIGV2ZW50IHNpZ25hbAo+ICAgICAgICB0byBnY2UuIFRoZSBldmVudCBpZCBp
cyBkZWZpbmVkIGluIHRoZSBnY2UgaGVhZGVyCj4gICAgICAgIGluY2x1ZGUvZHQtYmluZGluZ3Mv
Z2NlLzxjaGlwPi1nY2UuaCBvZiBlYWNoIGNoaXBzLgo+IC0gICAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQo+ICsgICAgJHJlZjogL3NjaGVtYXMv
dHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFycmF5Cj4KPiAgcmVxdWlyZWQ6Cj4gICAg
LSBjb21wYXRpYmxlCj4gLS0KPiAyLjM1LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
