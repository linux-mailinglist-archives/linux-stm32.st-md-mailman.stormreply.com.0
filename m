Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Q44HEpSW+WmB+AIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 09:04:52 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1724C7745
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 09:04:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6372DC90081;
	Tue,  5 May 2026 07:04:49 +0000 (UTC)
Received: from mail.kernel-space.org (v2202511311555398556.powersrv.de
 [46.38.245.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AF93C055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2026 05:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
 s=s1; t=1777960490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JpWMGrla8ujc+yJ0xsFuIV5CslqX+fFHzMu968BtRqs=;
 b=iGyIV0pokGRqOSR6yVS5OD8OgQUH1DfaNQTvqfIAtARXgTj/lyciwqZ7txwOhzCs36wjBW
 CzOy3NZSCXrGBnvWRZPQxNZsamZotkReSv4X+BNBw2wjhYq6GEVyq7f7/A2fZprO2PU6ER
 SUG2FJhrzSqiKnk42VeFQeSg3agl4qw=
Received: from [IPV6:2a07:7e81:7daa:0:62cf:84ff:feee:627] (<unknown>
 [2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by oreshnik (OpenSMTPD) with ESMTPSA id e45b9491
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 5 May 2026 05:54:50 +0000 (UTC)
Message-ID: <dcef09cb-3e99-4755-b423-5de1a4404fa1@kernel-space.org>
Date: Tue, 5 May 2026 07:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Greg Ungerer <gerg@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-10-874c36a4910d@baylibre.com>
 <965cb599-37ac-4d69-a8c0-015152037139@app.fastmail.com>
 <31297e73-52a5-42a0-9676-ecf057f7c21e@linux-m68k.org>
Content-Language: en-US, it
From: Angelo Dureghello <angelo@kernel-space.org>
In-Reply-To: <31297e73-52a5-42a0-9676-ecf057f7c21e@linux-m68k.org>
X-Mailman-Approved-At: Tue, 05 May 2026 07:04:46 +0000
Cc: Angelo Dureghello <adureghello@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Greg Ungerer <gerg@uclinux.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 10/10] iio: dac: add mcf54415 DAC
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
X-Rspamd-Queue-Id: 1A1724C7745
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[kernel-space.org : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel-space.org:s=s1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:gerg@linux-m68k.org,m:arnd@arndb.de,m:geert@linux-m68k.org,m:sfking@fdwdc.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:adureghello@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:gerg@uclinux.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-m68k.org,arndb.de,fdwdc.com,gmail.com,foss.st.com,kernel.org,baylibre.com,analog.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[angelo@kernel-space.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelo@kernel-space.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel-space.org:-];
	NEURAL_HAM(-0.00)[-0.656];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]

SGkgR3JlZywgQXJuZCwKCgpPbiA1LzUvMjYgMDQ6MDYsIEdyZWcgVW5nZXJlciB3cm90ZToKPiAK
PiBPbiA1LzUvMjYgMDM6MjcsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4+IE9uIE1vbiwgTWF5IDQs
IDIwMjYsIGF0IDE5OjE2LCBBbmdlbG8gRHVyZWdoZWxsbyB3cm90ZToKPj4KPj4+ICtzdGF0aWMg
dm9pZCBtY2Y1NDQxNV9kYWNfZXhpdCh2b2lkICpkYXRhKQo+Pj4gK3sKPj4+ICvCoMKgwqAgc3Ry
dWN0IG1jZjU0NDE1X2RhYyAqaW5mbyA9IGRhdGE7Cj4+PiArwqDCoMKgIGludCB2YWw7Cj4+PiAr
Cj4+PiArwqDCoMKgIHZhbCA9IHJlYWR3KGluZm8tPnJlZ3MgKyBNQ0Y1NDQxNV9EQUNfQ1IpOwo+
Pj4gK8KgwqDCoCB2YWwgfD0gTUNGNTQ0MTVfREFDX0NSX1BETjsKPj4+ICvCoMKgwqAgd3JpdGV3
KHZhbCwgaW5mby0+cmVncyArIE1DRjU0NDE1X0RBQ19DUik7Cj4+PiArfQo+Pgo+PiBXZSd2ZSBy
ZWNlbnRseSBkaXNjdXNzZWQgY2hhbmdpbmcgdGhlIE1NSU8gYWNjZXNzb3JzIG9uIGNvbGRmaXJl
Cj4+IHRvIGJlaGF2ZSBsaWtlIGFsbCB0aGUgb3RoZXIgb25lcywgd2hpY2ggbWFrZXMgcmVhZHco
KSBhbmQgd3JpdGV3KCkKPj4gaGF2ZSBhbiBpbXBsaWNpdCBieXRlc3dhcC4gQW4gYWRkaXRpb25h
bCBkcml2ZXIgbWVhbnMgb25lIG1vcmUKPj4gcGxhY2UgdG8gY2hhbmdlIGR1cmluZyB0aGUgY29u
dmVyc2lvbi4gTWF5YmUgeW91IGNhbiB1c2UgdGhlCj4+IG5ldyBtY2ZfcmVhZHcoKS9tY2Zfd3Jp
dGV3KCkgaGVscGVycyB0aGF0IEdyZWcgaGFzIHN0YXJ0ZWQKPj4gaW50cm9kdWNpbmc/IFRob3Nl
IHdpbGwga2VlcCB1c2luZyBuYXRpdmUgYmlnLWVuZGlhbiByZWdpc3Rlcgo+PiBkZWZpbml0aW9u
cy4KPiAKPiBZZXMsIHBsZWFzZSA6LSkKPiBUaG9zZSBuZXdseSBpbnRyb2R1Y2VkIG1jZl9yZWFk
WC9tY2Zfd3JpdGVYIGFyZSBpbiB0aGUgZm9yLW5leHQgYnJhbmNoCj4gb2YgdGhlIG02OGtub21t
dSBnaXQgdHJlZSBub3csIHRoZXkgaGF2ZSBub3QgaGl0IG1haW5saW5lIHlldCwgaG9wZWZ1bGx5
Cj4gaW4gdGhlIG5leHQgbWVyZ2UgY3ljbGUuCj4gCj4gU29tZXdoYXQgcmVsYXRlZCwgSSB3aWxs
IGhhdmUgcGF0Y2hlcyBvdXQgZm9yIHRoZSBvdGhlciBhZmZlY3RlZCBkcml2ZXJzCj4gb3ZlciB0
aGUgbmV4dCBmZXcgZGF5cy4KCmFjaywKCnN1cmUsIHdpbGwgZG8sIGFsc28gdW5kZXJzdGFuZGlu
ZyBwcm9wZXJseSB0aGUgdGhpbmcsIHNpbmNlIHdhcyBvdXQgZnJvbSBtNjhrCmZvciBzb21lIHRp
bWUuPiAKPiBSZWdhcmRzCj4gR3JlZwo+IAp0aGFua3MsCnJlZ2FyZHMsCmFuZ2Vsbz4gCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
