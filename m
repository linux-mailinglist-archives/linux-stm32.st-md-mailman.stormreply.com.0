Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6089719133B
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 15:31:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23E5EC36B0B;
	Tue, 24 Mar 2020 14:31:27 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A251C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 14:31:25 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48mtwY2rLZz1rsX5;
 Tue, 24 Mar 2020 15:31:25 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48mtwY23bvz1qqkB;
 Tue, 24 Mar 2020 15:31:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id vaw1NEZvxq0c; Tue, 24 Mar 2020 15:31:24 +0100 (CET)
X-Auth-Info: miHAmcPxqbCI9uMRYc4B3ALYCWlABjufYm/QOFykDKE=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 24 Mar 2020 15:31:23 +0100 (CET)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200323023145.3345133-1-marex@denx.de>
 <7f76ea73-122f-3761-a97b-57bdb99dc4fa@st.com>
 <4ffd8b7c-eb7d-83a4-3f6e-e156d3600532@denx.de>
 <c26637b2-7cf6-b7e2-3301-fafbbfde508e@st.com>
 <028556ba-f088-bf04-4473-a69569157411@denx.de>
 <792e11db-d345-03d4-6d8f-3f9b8ed40576@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <c399c8bb-3035-70e0-7499-71974f7c30f6@denx.de>
Date: Tue, 24 Mar 2020 15:31:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <792e11db-d345-03d4-6d8f-3f9b8ed40576@st.com>
Content-Language: en-US
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] [RFC] ARM: dts: stm32: Add DTs for
 STM32MP15x variants of the DH SOM and PDK2
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

T24gMy8yNC8yMCAzOjI4IFBNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+IAo+IAo+IE9uIDMv
MjQvMjAgMzoxNSBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDMvMjQvMjAgMzowNyBQTSwg
QWxleGFuZHJlIFRvcmd1ZSB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMy8yNC8yMCAyOjIyIFBNLCBN
YXJlayBWYXN1dCB3cm90ZToKPj4+PiBPbiAzLzI0LzIwIDI6MDQgUE0sIEFsZXhhbmRyZSBUb3Jn
dWUgd3JvdGU6Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IE9uIDMvMjMvMjAgMzozMSBBTSwgTWFyZWsgVmFz
dXQgd3JvdGU6Cj4+Pj4+PiBUaGUgREggUERLMiBjYW4gYmUgcG9wdWxhdGVkIHdpdGggU29NIHdp
dGggYW55IFNUTTMyTVAxNXggdmFyaWFudC4KPj4+Pj4+IEFkZCB0aGUgRFRzIGRlc2NyaWJpbmcg
dGhlIHJlbWFpbmluZyBjb21iaW5hdGlvbnMuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTog
TWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4+Pj4+PiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8
YWxleGFuZHJlLnRvcmd1ZUBzdC5jb20+Cj4+Pj4+PiBDYzogTWF4aW1lIENvcXVlbGluIDxtY29x
dWVsaW4uc3RtMzJAZ21haWwuY29tPgo+Pj4+Pj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmlj
ZS5jaG90YXJkQHN0LmNvbT4KPj4+Pj4+IENjOiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRl
bGF1bmF5QHN0LmNvbT4KPj4+Pj4+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCj4+Pj4+PiBUbzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4+Pj4+PiAtLS0KPj4+Pj4+IE5PVEU6IElzIHRoZXJlIGEgYmV0dGVyIHdheSB0byBkbyB0aGlz
IHRoYW4gdG8gaGF2ZSB0aGlzIGtpbmQgb2YgYQo+Pj4+Pj4gwqDCoMKgwqDCoMKgY29tYmluYXRv
cmlhbCBleHBsb3Npb24gb2YgRFRzID8KPj4+Pj4KPj4+Pj4gSSBoYXZlIG5vIGJldHRlciBpZGVh
LiBRdWVzdGlvbiB3YXMgdGhlIHNhbWUgZm9yIHN0bTMyIGJvYXJkcywgYW5kIEkKPj4+Pj4gY2hv
c2UgdG8gdGFrZSB0aGlzIG9wdGlvbi4KPj4+Pgo+Pj4+IE9uZSBvcHRpb24gd291bGQgYmUgdG8g
anVzdCBoYXZlIERUIGZvciB0aGUgbW9zdCBmZWF0dXJlLWNvbXBsZXRlCj4+Pj4gb3B0aW9uCj4+
Pj4gKDE1NykgYW5kIHRoZW4gaGF2ZSBVLUJvb3QgcmVtb3ZlIHRoZSBub2RlcyBmb3IgSFcgd2hp
Y2ggaXMgbm90IHByZXNlbnQKPj4+PiBvbiB0aGUgcGFydGljdWxhciBTb0Mgb3B0aW9uIGlmIGl0
J3Mgb25lIG9mIHRoZSBtb3JlIGxpbWl0ZWQgb25lcyAoMTUzLAo+Pj4+IDE1MSkuCj4+Pj4KPj4+
Cj4+PiBZZXMgaXQgd2FzIGEgcG9zc2liaWxpdHkgdGhhdCBJIGRpc2N1c3NlZCB3aXRoIGtldmlu
IEguIGF0IHRoZSBsYXRlc3QKPj4+IEVMQ0UgYnV0IGF0IHRoZSBlbmQgdGhlIGJlc3Qgd2F5IHRv
IGZvbGxvdyB3YXMgdG8gZW5oYW5jZSBudW1iZXIgb2YgZHRzCj4+PiBmaWxlcy4gVGhlIGJlc3Qg
d291bGQgYmUgdG8gaGF2ZSBkZWRpY2F0ZWQgZm9sZGVycyBidXQgaXQgaXMgYW5vdGhlcgo+Pj4g
c3RvcnkuCj4+Cj4+IE9yIHVzZSBEVCBvdmVybGF5cyBzb21laG93ID8gVS1Cb290IGNhbiBhcHBs
eSBEVE9zIG9udG8gRFQgYmVmb3JlCj4+IGJvb3RpbmcgTGludXguCj4+Cj4+IEhhdmluZyB0b25z
IG9mIERUcyBvbiBhIHN5c3RlbSBpcyBhIGxvdCBvZiBkdXBsaWNhdGlvbiwgSSBkb24ndCByZWFs
bHkKPj4gbGlrZSB0aGF0Lgo+IAo+IEkgYWdyZWUgdGhhdCB0byBtYWludGFpbiBpdCdzIGEgbmln
aHRtYXJlLCBidXQgaXQncyBhIHdheSB0byBoZWxwIERUIHVzZXJzLgo+IAo+Pgo+PiBCdXQgZm9y
IHN0YXJ0ZXJzLCBmZWVsIGZyZWUgdG8gcmV2aWV3IHRoaXMgcGF0Y2guCj4+Cj4gCj4gWW91ciBw
YXRjaCBzb3VuZHMgZ29vZC4KClRoZW4gZmVlbCBmcmVlIHRvIGFwcGx5IGl0LCB0aGFua3MuCgpi
dHcgZG9uJ3QgeW91IGhhdmUgYSAibmV4dCIgdHJlZSBzb21ld2hlcmUgd2l0aCBhbGwgdGhlIHBh
dGNoZXMgcXVldWVkCnVwIGZvciBuZXh0IHJlbGVhc2UgPyBJZiBJIHJlYmFzZSBvbiBsaW51eCBu
ZXh0LCBJIHN0aWxsIGhhdmUgcXVpdGUgYQpmZXcgc3RtMzJtcDEgRFQgcGF0Y2hlcyBpbiBteSB0
cmVlIHdoaWNoIGFyZSBwcmVzdW1hYmx5IGFwcGxpZWQsIGJ1dCBJCmRvbid0IHNlZSB0aGVtIGlu
IGxpbnV4IG5leHQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
