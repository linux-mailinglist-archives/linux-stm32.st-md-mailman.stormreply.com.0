Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1305A21146F
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Jul 2020 22:30:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3BFFC36B24;
	Wed,  1 Jul 2020 20:30:57 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38A71C36B22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2020 20:30:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id DEA832A5718
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
In-Reply-To: <6400388.H4HLtoO0Qf@diego>
References: <20200609174959.955926-1-adrian.ratiu@collabora.com>
 <6400388.H4HLtoO0Qf@diego>
Date: Wed, 01 Jul 2020 23:32:18 +0300
Message-ID: <87imf7j7sd.fsf@collabora.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yannick FERTRE <yannick.fertre@st.com>, linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com
Subject: Re: [Linux-stm32] [PATCH v9 00/11] Genericize DW MIPI DSI bridge
 and add i.MX 6 driver
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgSGVpa28sCgpPbiBXZWQsIDAxIEp1bCAyMDIwLCBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPiBIaSBBZHJpYW4sIAo+IAo+IEFtIERpZW5zdGFnLCA5LiBKdW5pIDIw
MjAsIDE5OjQ5OjQ4IENFU1Qgc2NocmllYiBBZHJpYW4gUmF0aXU6IAo+PiBbUmUtc3VibWl0dGlu
ZyB0byBjYyBkcmktZGV2ZWwsIHNvcnJ5IGFib3V0IHRoZSBub2lzZV0gIEhlbGxvIAo+PiBhbGws
ICB2OSBjbGVhbmx5IGFwcGxpZXMgb24gdG9wIG9mIGxhdGVzdCBuZXh0LTIwMjAwNjA5IHRyZWUu
IAo+IAo+IGF0IGxlYXN0IGl0IGRvZXNuJ3QgYXBwbHkgb24gdG9wIG9mIGN1cnJlbnQgZHJtLW1p
c2MtbmV4dCBmb3IgbWUgCj4gd2hpY2ggSSByZWFsbHkgZG9uJ3QgdW5kZXJzdGFuZC4gCj4gCj4g
TGlrZSBwYXRjaCAyLzExIGRvZXMgCj4gCj4gQEAgLTMxLDYgKzMxLDcgQEAgCj4gICNpbmNsdWRl
IDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPiAKPiAuIAo+ICAjZGVmaW5lIEhXVkVSXzEzMTwtLS0t
PjwtLS0tLS0+PC0tLS0tLT4weDMxMzMzMTAwPC0tLS0+LyogSVAgCj4gIHZlcnNpb24gMS4zMSAq
LyAKPiArI2RlZmluZSBIV1ZFUl8xMzA8LS0tLT48LS0tLS0tPjwtLS0tLS0+MHgzMTMzMzAwMDwt
LS0tPi8qIElQIAo+IHZlcnNpb24gMS4zMCAqLyAuIAo+ICAjZGVmaW5lIERTSV9WRVJTSU9OPC0t
PjwtLS0tLS0+PC0tLS0tLT4weDAwICNkZWZpbmUgCj4gIFZFUlNJT048LS0tLS0tPjwtLS0tLS0+
PC0tLS0tLT48LS0tLS0tPkdFTk1BU0soMzEsIDgpIAo+IAo+IHdoZXJlIHRoZSBmaWxlIGN1cnJl
bnRseSBsb29rcyBsaWtlIAo+IAo+ICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4g
I2luY2x1ZGUgPGRybS9kcm1fYnJpZGdlLmg+IAo+ICNpbmNsdWRlIDxkcm0vZHJtX2NydGMuaD4g
I2luY2x1ZGUgPGRybS9kcm1fbWlwaV9kc2kuaD4gI2luY2x1ZGUgCj4gPGRybS9kcm1fbW9kZXMu
aD4gI2luY2x1ZGUgPGRybS9kcm1fb2YuaD4gI2luY2x1ZGUgCj4gPGRybS9kcm1fcHJpbnQuaD4g
Cj4gCj4gI2RlZmluZSBIV1ZFUl8xMzEJCQkweDMxMzMzMTAwCS8qIElQIAo+IHZlcnNpb24gMS4z
MSAqLyAKPiAKPiAjZGVmaW5lIERTSV9WRVJTSU9OCQkJMHgwMCAjZGVmaW5lIFZFUlNJT04gCj4g
R0VOTUFTSygzMSwgOCkgCj4gIAo+IGV2ZW4gaW4gTGludXgtbmV4dCAKPiAgCj4gU28gSSBndWVz
cyBpZGVhbGx5IHJlYmFzZSBvbiB0b3Agb2YgZHJtLW1pc2MtbmV4dAoKSSB3aWxsIHNlbmQgYSBy
ZWJhc2Ugb24gdG9wIG9mIGRybS1taXNjLW5leHQgc29vbiAod2l0aCB0aGUgbGFzdCAKRFRTIG5p
dHBpY2sgZml4ZWQgYW5kIHRoZSBsYXRlc3QgYWNrcyBhbmQgcmV2aWV3ZWQtYnkgdGFncyBhZGRl
ZCkuCgpJbiB0aGUgbWVhbnRpbWUgSSBhbHNvIGZvdW5kIHNvbWVvbmUgd2l0aGluIENvbGxhYm9y
YSB3aG8gaGFzIGEgUksgCndpdGggYSBEU0kgcGFuZWwgYW5kIGZvdW5kIGEgYnVnIChsaWtlbHkg
Y2xvY2sgaXMgbm90IGVuYWJsZWQgCmVhcmx5IGVub3VnaCB0byBhY2Nlc3MgdGhlIGNmZyByZWdp
c3RlcnMgdG8gZ2V0IHRoZSB2ZXJzaW9uIGZvciAKcmVnbWFwKS4KCkknbSBzdXBlciBoYXBweSB0
aGlzIGlzIGdldHRpbmcgdGVzdGVkIG9uIFJLLCB0aGFuayB5b3UhCgo+Cj4KPiBUaGFua3MKPiBI
ZWlrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
