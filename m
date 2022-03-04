Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 112E34CE132
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Mar 2022 00:49:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C694CC60493;
	Fri,  4 Mar 2022 23:49:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FDDCC6046D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 23:49:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2466861F2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 23:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB11C340F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 23:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646437770;
 bh=4ELZp74PMU7CcPVa1I6hOUB32VqfOzoIpZtL5yF8JJM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bH8Y9/qdfdmdEHqoPRStJ7/fyR414JEoPT8jqsRV7LWELkcJMkLjrB6qlTo4SvWoO
 rkqZduxODORdeDwBSek+U6J7GS+DpuEq8APBgOyPkiLAfMEYExBoFr4CYdJWOQmUsC
 7d4g/jAurqDNgogC57b3sMARoQgqA+7lizXuxw8Jt9YuAycE8UAdVw46OFZqnNIrRm
 DXTblS8GaC04L+TmYEeojPB5v8Ol1JQZVLSsJn2sMHrB4iWJGVf4Ec0QB4TrB02F7E
 1rysmAvGAHVeSdhPPHABHD6KFG3l9s9PTNZzRf2ytP6wApzGyBdpczY6EeYoGVsvj2
 6tz6mXbSMcQnQ==
Received: by mail-ej1-f42.google.com with SMTP id bi12so7403772ejb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Mar 2022 15:49:30 -0800 (PST)
X-Gm-Message-State: AOAM533TG2UaTy8crNBDNGKUZpKO2bseKfMqSh8qGYw32vjHGYo62X4S
 YCK4c4dW6eFMvBKB2ndDKky4wkaOgAkZgh0k5g==
X-Google-Smtp-Source: ABdhPJwKzfXlFjDAMAwtLcoz0QtxWyjlL5WxxrHe/cElb7iEak4IuABWyNlIa9tTLPAXSXTcst+Vdbv+PcgD7ZHGvOs=
X-Received: by 2002:a17:907:e87:b0:6da:8de2:ce94 with SMTP id
 ho7-20020a1709070e8700b006da8de2ce94mr959302ejc.406.1646437768870; Fri, 04
 Mar 2022 15:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 5 Mar 2022 07:49:17 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8CTewRw2Le9RjXoCrqF8AyHD0_p01EMiJ2QQ63yf-HKQ@mail.gmail.com>
Message-ID: <CAAOTY_8CTewRw2Le9RjXoCrqF8AyHD0_p01EMiJ2QQ63yf-HKQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 0/3] Fix MediaTek display dt-bindings
	issues
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

SGksIFJvYjoKCldvdWxkIHlvdSBsaWtlIHRvIHRha2UgdGhpcyBzZXJpZXMgaW50byB5b3VyIHRy
ZWUsIG9yIEkgdGFrZSB0aGlzCnNlcmllcyBpbnRvIG15IHRyZWU/CgpSZWdhcmRzLApDaHVuLUt1
YW5nLgoKQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbT4g5pa8CjIwMjLlubQz5pyINOaXpSDpgLHkupQg5LiL5Y2INTo1NeWv
q+mBk++8mgo+Cj4gVGhlIHZkb3N5czAgc2VyaWVzIGNhcnJpZWQgYSBuaWNlIGR0LWJpbmRpbmdz
IGNvbnZlcnNpb24gb2YgdGhlIG9sZAo+IHR4dCBkb2N1bWVudGF0aW9uIGZvciB0aGUgZW50aXJl
IG1lZGlhdGVrLWRybSBkcml2ZXIsIGJ1dCBzb21lIG9mCj4gdGhlIGlzc3VlcyBpbiB0aGVyZSB3
ZXJlbid0IHNlZW4uCj4KPiBUaGlzIHNlcmllcyBpcyBmaXhpbmcgYWxsIG9mIHRoZSBpc3N1ZXMg
cG9pbnRlZCBvdXQgYnkgYQo+IGBkdF9iaW5kaW5nX2NoZWNrYCBydW4sIGZvbGxvd2VkIGJ5IGBk
dGJzX2NoZWNrYC4KPgo+IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vICgzKToKPiAgIGR0LWJp
bmRpbmdzOiBkaXNwbGF5OiBtZWRpYXRlayxtdXRleDogRml4IG1lZGlhdGVrLGdjZS1ldmVudHMg
dHlwZQo+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrLG92bDogRml4ICdpb21tdScg
cmVxdWlyZWQgcHJvcGVydHkgdHlwbwo+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVr
OiBGaXggZXhhbXBsZXMgb24gbmV3IGJpbmRpbmdzCj4KPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssYWFsLnlhbWwgICAgICAgIHwgMjQgKysrLS0KPiAgLi4uL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssY2NvcnIueWFtbCAgICAgIHwgMjMgKysrLS0KPiAgLi4uL2Rpc3BsYXkvbWVk
aWF0ZWsvbWVkaWF0ZWssY29sb3IueWFtbCAgICAgIHwgMjMgKysrLS0KPiAgLi4uL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZGl0aGVyLnlhbWwgICAgIHwgMjMgKysrLS0KPiAgLi4uL2Rpc3Bs
YXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnlhbWwgICAgICAgIHwgIDMgKy0KPiAgLi4uL2Rpc3Bs
YXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnlhbWwgICAgICAgIHwgMjMgKysrLS0KPiAgLi4uL2Rp
c3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZXRoZHIueWFtbCAgICAgIHwgOTkgKysrKysrKysrKy0t
LS0tLS0tLQo+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxnYW1tYS55YW1sICAgICAg
fCAyMyArKystLQo+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJnZS55YW1sICAg
ICAgfCA0OSArKysrKy0tLS0KPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbXV0ZXgu
eWFtbCAgICAgIHwgMjcgKysrLS0KPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssb2Qu
eWFtbCAgICAgICAgIHwgMTQgKystCj4gIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG92
bC0ybC55YW1sICAgICB8IDI2ICsrKy0tCj4gIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LG92bC55YW1sICAgICAgICB8IDI4ICsrKystLQo+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxwb3N0bWFzay55YW1sICAgfCAyMyArKystLQo+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxyZG1hLnlhbWwgICAgICAgfCAyOCArKysrLS0KPiAgLi4uL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssc3BsaXQueWFtbCAgICAgIHwgMTcgKysrLQo+ICAuLi4vZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayx1Zm9lLnlhbWwgICAgICAgfCAxOSArKy0tCj4gIC4uLi9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLHdkbWEueWFtbCAgICAgICB8IDI2ICsrKy0tCj4gIDE4IGZpbGVzIGNo
YW5nZWQsIDMxOCBpbnNlcnRpb25zKCspLCAxODAgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMzUu
MQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
