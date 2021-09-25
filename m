Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CAB417F3D
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Sep 2021 04:11:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9340C5A4F7;
	Sat, 25 Sep 2021 02:11:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1A61C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Sep 2021 02:11:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1FAC610EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Sep 2021 02:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632535876;
 bh=bh2NnvETqZ5gppTlIxdn7adU8NHofIsaMMg5rGECvIs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oyXkVs0M9xuz9X0bXR7/OLdzcXDXj+3NZbVkICK0B6LOn7gsOhWZKos44L9RBL5uD
 BwIJbHEEidbS9QkrLI2sNoW4Ax3xN9Bmc5DTlxF1VTJibs2mC8MRFn22KYx5dtt3bf
 cNBDnAA7OuYi1HhmOP4ng/RjMxsnN1vS0WhVzYXGQqyGJS42jWbWlFVa67xx2FAGTY
 kJXtiagOrPopJiPuMmZGlKivK4QP/7Dd4GFr5B+kfyGAkRHeDkILUYTUItJA48ftFO
 66LvFyl/hZc3BaTa11PSR2BzR9HgPQGo74IZopZdl10Kmm/a+2T6k3ahghE+dAI/i0
 /aF+O/fDYvGZQ==
Received: by mail-ed1-f41.google.com with SMTP id s17so24454679edd.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Sep 2021 19:11:16 -0700 (PDT)
X-Gm-Message-State: AOAM531A6mlVxrx6UvEOziYKwYPxU3q3zp62t0MOUuQdYPwrNn2YYRiR
 qhR19kTIU8/TaQiZwSFYnfSDtgeH7Qc7CrllMQ==
X-Google-Smtp-Source: ABdhPJxHVfwE5NBLEqjXLuieV73XDg/3aABwa8SyIvmNcOwLifu66viuQEN5dIOmQCviZEg+9kCT9dfv4FoGZK01SQc=
X-Received: by 2002:a17:906:26c4:: with SMTP id
 u4mr14435742ejc.511.1632535875178; 
 Fri, 24 Sep 2021 19:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-5-jason-jh.lin@mediatek.com>
In-Reply-To: <20210921155218.10387-5-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 25 Sep 2021 10:11:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8uRKQP5AEp6V4Ez1YZAfSYrruo5n-hG=Vp3GUPUE=sGA@mail.gmail.com>
Message-ID: <CAAOTY_8uRKQP5AEp6V4Ez1YZAfSYrruo5n-hG=Vp3GUPUE=sGA@mail.gmail.com>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: fshao@chromium.org, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Fabien Parent <fparent@baylibre.com>, DTML <devicetree@vger.kernel.org>,
 Nancy Lin <nancy.lin@mediatek.com>, linux-stm32@st-md-mailman.stormreply.com,
 roy-cw.yeh@mediatek.com, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Moudy Ho <moudy.ho@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v11 04/16] dt-bindings: display: mediatek:
 dsc: add yaml for mt8195 SoC binding
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDnmnIgyMeaXpSDpgLHkuowg5LiL5Y2IMTE6NTLlr6vpgZPvvJoKPgo+IDEuIEFkZCBt
ZWRpYXRlayxkc2MueWFtbCB0byBkZXNjcmliZSBEU0MgbW9kdWxlIGluIGRldGFpbHMuCj4gMi4g
QWRkIG10ODE5NSBTb0MgYmluZGluZyB0byBtZWRpYXRlayxkc2MueWFtbC4KClJldmlld2VkLWJ5
OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2Zm
LWJ5OiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIC4u
Li9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzYy55YW1sICAgICAgICB8IDcxICsrKysrKysr
KysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKykKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLGRzYy55YW1sCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxkc2MueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4x
ZWMwODNlZmY4MjQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnlhbWwKPiBAQCAtMCww
ICsxLDcxIEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1Ig
QlNELTItQ2xhdXNlKQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2MueWFtbCMKPiArJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+
ICt0aXRsZTogbWVkaWF0ZWsgZGlzcGxheSBEU0MgY29udHJvbGxlcgo+ICsKPiArbWFpbnRhaW5l
cnM6Cj4gKyAgLSBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiArICAt
IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gKwo+ICtkZXNjcmlwdGlv
bjogfAo+ICsgIFRoZSBEU0Mgc3RhbmRhcmQgaXMgYSBzcGVjaWZpY2F0aW9uIG9mIHRoZSBhbGdv
cml0aG1zIHVzZWQgZm9yCj4gKyAgY29tcHJlc3NpbmcgYW5kIGRlY29tcHJlc3NpbmcgaW1hZ2Ug
ZGlzcGxheSBzdHJlYW1zLCBpbmNsdWRpbmcKPiArICB0aGUgc3BlY2lmaWNhdGlvbiBvZiB0aGUg
c3ludGF4IGFuZCBzZW1hbnRpY3Mgb2YgdGhlIGNvbXByZXNzZWQKPiArICB2aWRlbyBiaXQgc3Ry
ZWFtLiBEU0MgaXMgZGVzaWduZWQgZm9yIHJlYWwtdGltZSBzeXN0ZW1zIHdpdGgKPiArICByZWFs
LXRpbWUgY29tcHJlc3Npb24sIHRyYW5zbWlzc2lvbiwgZGVjb21wcmVzc2lvbiBhbmQgRGlzcGxh
eS4KPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIG9uZU9mOgo+ICsg
ICAgICAtIGl0ZW1zOgo+ICsgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTk1LWRpc3At
ZHNjCj4gKwo+ICsgIHJlZzoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGludGVycnVwdHM6
Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBjbG9ja3M6Cj4gKyAgICBpdGVtczoKPiArICAg
ICAgLSBkZXNjcmlwdGlvbjogRFNDIFdyYXBwZXIgQ2xvY2sKPiArCj4gKyAgcG93ZXItZG9tYWlu
czoKPiArICAgIGRlc2NyaXB0aW9uOiBBIHBoYW5kbGUgYW5kIFBNIGRvbWFpbiBzcGVjaWZpZXIg
YXMgZGVmaW5lZCBieSBiaW5kaW5ncyBvZgo+ICsgICAgICB0aGUgcG93ZXIgY29udHJvbGxlciBz
cGVjaWZpZWQgYnkgcGhhbmRsZS4gU2VlCj4gKyAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wb3dlci9wb3dlci1kb21haW4ueWFtbCBmb3IgZGV0YWlscy4KPiArCj4gKyAg
bWVkaWF0ZWssZ2NlLWNsaWVudC1yZWc6Cj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgVGhl
IHJlZ2lzdGVyIG9mIGNsaWVudCBkcml2ZXIgY2FuIGJlIGNvbmZpZ3VyZWQgYnkgZ2NlIHdpdGgg
NCBhcmd1bWVudHMKPiArICAgICAgZGVmaW5lZCBpbiB0aGlzIHByb3BlcnR5LCBzdWNoIGFzIHBo
YW5kbGUgb2YgZ2NlLCBzdWJzeXMgaWQsCj4gKyAgICAgIHJlZ2lzdGVyIG9mZnNldCBhbmQgc2l6
ZS4KPiArICAgICAgRWFjaCBzdWJzeXMgaWQgaXMgbWFwcGluZyB0byBhIGJhc2UgYWRkcmVzcyBv
ZiBkaXNwbGF5IGZ1bmN0aW9uIGJsb2Nrcwo+ICsgICAgICByZWdpc3RlciB3aGljaCBpcyBkZWZp
bmVkIGluIHRoZSBnY2UgaGVhZGVyCj4gKyAgICAgIGluY2x1ZGUvZHQtYmluZGluZ3MvZ2NlLzxj
aGlwPi1nY2UuaC4KPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3BoYW5kbGUtYXJyYXkKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICtyZXF1aXJlZDoKPiArICAt
IGNvbXBhdGlibGUKPiArICAtIHJlZwo+ICsgIC0gaW50ZXJydXB0cwo+ICsgIC0gcG93ZXItZG9t
YWlucwo+ICsgIC0gY2xvY2tzCj4gKwo+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiAr
Cj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsKPiArICAgIGRzYzA6IGRpc3BfZHNjX3dyYXBAMWMw
MDkwMDAgewo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWRpc3AtZHNj
IjsKPiArICAgICAgICByZWcgPSA8MCAweDFjMDA5MDAwIDAgMHgxMDAwPjsKPiArICAgICAgICBp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgNjQ1IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47Cj4gKyAgICAg
ICAgcG93ZXItZG9tYWlucyA9IDwmc3BtIE1UODE5NV9QT1dFUl9ET01BSU5fVkRPU1lTMD47Cj4g
KyAgICAgICAgY2xvY2tzID0gPCZ2ZG9zeXMwIENMS19WRE8wX0RTQ19XUkFQMD47Cj4gKyAgICAg
ICAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWcgPSA8JmdjZTEgU1VCU1lTXzFjMDBYWFhYIDB4OTAw
MCAweDEwMDA+Owo+ICsgICAgfTsKPiAtLQo+IDIuMTguMAo+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
