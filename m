Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0034E640B
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Mar 2022 14:26:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09F6BC60497;
	Thu, 24 Mar 2022 13:26:04 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0EB0C60469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 13:26:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8E0B4B823E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 13:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C38D5C340FC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 13:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648128360;
 bh=fyIiU5RZ5vQvJ0AbYHjhGoBAWCrDkNOaT9PweDfIA54=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q5jVk0jR0N8AxYnAmlI/4hn9WXOJoqruiN3Lx4o5Q7LvZ7+QE7Os06E+7SSbr55jK
 AjNuwfG++wDfE+/s3NDSLIJfCb+2ktBuloavqEAmw7YphDTda4uOxn/oUPRqlu3F7Y
 orG4xR6LpBhXMERtPv8WWxtisu3krU/p0+bIGgbdXdFvuCJ+l8GR5tqTZPIiqs+ULD
 +y7kI2iUuz8DojIZ7dmk7HgWETysRWE2svWhvxRZbDT8j9gytgcGh/0zCfZo7YUzm2
 OIo0ksBhURzjt2b+H3GembODH1Q6MzPFgeBgAHPHiNXydBJoiKybaVS25qDAJ/AgyH
 izJ/bVYB21G0w==
Received: by mail-ej1-f49.google.com with SMTP id bg10so9162086ejb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 06:26:00 -0700 (PDT)
X-Gm-Message-State: AOAM532CaOAZIQR+4+qAtHhaEMBJ+O3Yt3qfzLbrGbUiEvLviTM+ikOs
 uy1LCR98tl7z700DctLarNu9smrCsj+dWI6LYQ==
X-Google-Smtp-Source: ABdhPJxMtishIXyQnHytEurL58PXSNq0mjIOLyhlOsXwq+vbDhHOyF+FHGCUAHZ5No9IqBKpjNCuQP5Pnh/dbKKnyGA=
X-Received: by 2002:a17:906:79c4:b0:6cf:5489:da57 with SMTP id
 m4-20020a17090679c400b006cf5489da57mr5757085ejo.48.1648128358773; Thu, 24 Mar
 2022 06:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220309134702.9942-1-jason-jh.lin@mediatek.com>
 <CAL_Jsq+=hTKTjB8rR77_uQYKDWHzLyTdeU7zbixSCZCNrdmNvg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+=hTKTjB8rR77_uQYKDWHzLyTdeU7zbixSCZCNrdmNvg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 24 Mar 2022 21:25:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY__kzL8YuGo-oKct4c_bL-Ch5rW8wBpkhOXkK+a10gNXVg@mail.gmail.com>
Message-ID: <CAAOTY__kzL8YuGo-oKct4c_bL-Ch5rW8wBpkhOXkK+a10gNXVg@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Fei Shao <fshao@chromium.org>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v2 0/4] Fix MediaTek display dt-bindings
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

SGksIFJvYjoKClJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IOaWvCAyMDIy5bm0M+aciDIz
5pelIOmAseS4iSDkuIvljYgxMDoxMOWvq+mBk++8mgo+Cj4gT24gV2VkLCBNYXIgOSwgMjAyMiBh
dCA3OjQ3IEFNIGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gVGhlIHZkb3N5czAgc2VyaWVzIGNhcnJpZWQgYSBuaWNlIGR0LWJpbmRpbmdzIGNv
bnZlcnNpb24gb2YgdGhlIG9sZAo+ID4gdHh0IGRvY3VtZW50YXRpb24gZm9yIHRoZSBlbnRpcmUg
bWVkaWF0ZWstZHJtIGRyaXZlciwgYnV0IHNvbWUgb2YKPiA+IHRoZSBpc3N1ZXMgaW4gdGhlcmUg
d2VyZW4ndCBzZWVuLgo+ID4KPiA+IFRoaXMgc2VyaWVzIGlzIGZpeGluZyBhbGwgb2YgdGhlIGlz
c3VlcyBwb2ludGVkIG91dCBieSBhCj4gPiBgZHRfYmluZGluZ19jaGVja2AgcnVuLCBmb2xsb3dl
ZCBieSBgZHRic19jaGVja2AuCj4gPgo+ID4gQ2hhbmdlIGluIHYyOgo+ID4gLSByZW1vdmUgbWVk
aWF0ZWssZXRoZHIueWFtbCBmaWxlCj4gPiAtIGNoYW5nZSBpbmNsdWRlIGhlYWRlciBvZiBtZWRp
YXRlayxvdmwtMmwueWFtbCBmcm9tIG10ODE3MyB0byBtdDgxODMKPiA+Cj4gPiBBbmdlbG9HaW9h
Y2NoaW5vIERlbCBSZWdubyAoMyk6Cj4gPiAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBtZWRpYXRl
aywgbXV0ZXg6IEZpeCBtZWRpYXRlaywgZ2NlLWV2ZW50cyB0eXBlCj4gPiAgIGR0LWJpbmRpbmdz
OiBkaXNwbGF5OiBtZWRpYXRlaywgb3ZsOiBGaXggJ2lvbW11JyByZXF1aXJlZCBwcm9wZXJ0eQo+
ID4gICAgIHR5cG8KPiA+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrOiBGaXggZXhh
bXBsZXMgb24gbmV3IGJpbmRpbmdzCj4gPgo+ID4gamFzb24tamgubGluICgxKToKPiA+ICAgUmV2
ZXJ0ICJkdC1iaW5kaW5nczogZGlzcGxheTogbWVkaWF0ZWs6IGFkZCBldGhkciBkZWZpbml0aW9u
IGZvcgo+ID4gICAgIG10ODE5NSIKPgo+IENhbiB0aGlzIHNlcmllcyBnZXQgYXBwbGllZCBzb29u
PyBsaW51eC1uZXh0IGlzIHN0aWxsIGJyb2tlbi4KPgo+IElmIGl0IGhpdHMgTGludXMnIHRyZWUs
IEkgd2lsbCBiZSBhcHBseWluZyB0aGVtLgoKSSd2ZSBhcHBsaWVkIHRoaXMgc2VyaWVzIHRvIG15
IHRyZWUgWzFdLCBidXQgbm93IGlzIG1lcmdlIHdpbmRvdywgc28gSQpwbGFuIHRvIHNlbmQgdGhp
cyBzZXJpZXMgdGhyb3VnaCBEYXZlJ3MgdHJlZSBhZnRlciA1LjE4LXJjMS4gV291bGQKdGhpcyBi
ZSB0b28gbGF0ZSBmb3IgeW91PwoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRy
bS1maXhlcwoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBSb2IKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
