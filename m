Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C25B2356885
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Apr 2021 11:56:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67CB2C5719D;
	Wed,  7 Apr 2021 09:56:03 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64688C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Apr 2021 09:56:01 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4FFfsq3khsz1qtPt;
 Wed,  7 Apr 2021 11:55:58 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4FFfsp5V4Mz1r1Ml;
 Wed,  7 Apr 2021 11:55:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id nqZshmjpShtJ; Wed,  7 Apr 2021 11:55:56 +0200 (CEST)
X-Auth-Info: Och8Nif2NLXaKUtGnZ2RZQidzSWXk6tDEFseKM0edes=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  7 Apr 2021 11:55:56 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201224061832.92010-1-marex@denx.de>
 <YFfvjyllBa/tqTqI@pendragon.ideasonboard.com>
 <4372d1cd-ffdb-e545-7262-d1ad1a649770@denx.de>
Message-ID: <3a25b8db-8968-0f07-21fe-69fa43f438f5@denx.de>
Date: Wed, 7 Apr 2021 11:55:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <4372d1cd-ffdb-e545-7262-d1ad1a649770@denx.de>
Content-Language: en-US
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 Yannick Fertre <yannick.fertre@st.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [Linux-stm32] [PATCH V2] drm/bridge: lvds-codec: Add support
 for pixel data sampling edge select
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

T24gMy8yMi8yMSAxMToyOSBBTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMy8yMi8yMSAyOjE0
IEFNLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+PiBIaSBNYXJlaywKPiAKPiBIaSwKPiAKPiBb
Li4uXQo+IAo+Pj4gZGlmZiAtLWdpdCAKPj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMueWFtbCAKPj4+IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMueWFtbAo+Pj4g
aW5kZXggZTVlM2M3MjYzMGNmLi4zOTlhNjUyODc4MGEgMTAwNjQ0Cj4+PiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy1jb2RlYy55YW1s
Cj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvbHZkcy1jb2RlYy55YW1sCj4+PiBAQCAtNzQsNiArNzQsMTMgQEAgcHJvcGVydGllczoKPj4+
IMKgwqDCoMKgwqAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4+PiArwqAgcGl4ZWxjbGst
YWN0aXZlOgo+Pj4gK8KgwqDCoCBkZXNjcmlwdGlvbjogfAo+Pj4gK8KgwqDCoMKgwqAgRGF0YSBz
YW1wbGluZyBvbiByaXNpbmcgb3IgZmFsbGluZyBlZGdlLgo+Pj4gK8KgwqDCoMKgwqAgVXNlIDAg
dG8gc2FtcGxlIHBpeGVsIGRhdGEgb24gcmlzaW5nIGVkZ2UgYW5kCj4+PiArwqDCoMKgwqDCoCBV
c2UgMSB0byBzYW1wbGUgcGl4ZWwgZGF0YSBvbiBmYWxsaW5nIGVkZ2UgYW5kCj4+PiArwqDCoMKg
IGVudW06IFswLCAxXQo+Pgo+PiBUaGUgaWRlYSBpcyBnb29kLCBidXQgaW5zdGVhZCBvZiBhZGRp
bmcgYSBjdXN0b20gcHJvcGVydHksIGhvdyBhYm91dAo+PiByZXVzaW5nIHRoZSBwY2xrLXNhbXBs
ZSBwcm9wZXJ0eSBkZWZpbmVkIGluCj4+IC4uLy4uL21lZGlhL3ZpZGVvLWludGVyZmFjZXMueWFt
bCA/Cj4gCj4gUmVwZWF0aW5nIG15c2VsZiBmcm9tIFYxIGRpc2N1c3Npb24gLi4uIEVpdGhlciBp
cyBmaW5lIGJ5IG1lLCBidXQgSSAKPiB0aGluayBwaXhlbGNsay1hY3RpdmUsIHdoaWNoIGNvbWVz
IGZyb20gcGFuZWwtdGltaW5ncy55YW1sIGlzIGNsb3NlciB0byAKPiB0aGUgdmlkZW8gdGhhbiBt
dWx0aW1lZGlhIGJpbmRpbmdzLgoKV2FzIHRoZXJlIGV2ZXIgYW55IHJlcGx5IGZyb20gUm9iIG9u
IHRoaXMgPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
