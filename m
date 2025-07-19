Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E82EAB0B1AD
	for <lists+linux-stm32@lfdr.de>; Sat, 19 Jul 2025 22:00:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CFEBC3089E;
	Sat, 19 Jul 2025 20:00:05 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36056C36B19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Jul 2025 20:00:04 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1752955203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=trKgn9wFZ9o39XTS77tPA/b9wbDJPWjgDVHnBcgVX6g=;
 b=DqffrOIH5d/T0eaNuzXb24+AOr6tqWAIFA1kNE5nbjesD9vJWq+g2pJ50/9NGQojFURx7Y
 dtM+HbJ3pSjcOHaSKKZCzc87PuLxb+Bwk1veq/8hnxAgDTfu5KCIuCEMj649nLLhRPcnsS
 4KbRJuUoWSpOfb6mZ78lMQq0iGmn2fcLcgy2vFsQLxry8TDs7DYJJwbnNYG9fQwrLwOk9Q
 eS+EYRmT5MFYMDMlFwXj36R/sP11IWD6jSqmDLmuv1kDhHMRq4wOcSUKdC+n74gEl3oI3c
 lWDnXL5Y2FGlOfHsaInhM5dfgOP9rd/esONpN2k6owDSNtu07zJ45LzsskURww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1752955203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=trKgn9wFZ9o39XTS77tPA/b9wbDJPWjgDVHnBcgVX6g=;
 b=KVNZ9gc3y71iyqP9P6vcq8GnI2oZ677aSw+q5/n7M22IkOMMcWklu5t8dmY5hLtCmAfvZi
 xLKrLtM0/JO9FWDg==
To: Markus =?utf-8?Q?Bl=C3=B6chl?= <markus@blochl.de>, Andrew Lunn
 <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
In-Reply-To: <20250713-stmmac_crossts-v1-1-31bfe051b5cb@blochl.de>
References: <20250713-stmmac_crossts-v1-1-31bfe051b5cb@blochl.de>
Date: Sat, 19 Jul 2025 22:00:02 +0200
Message-ID: <87o6tguf25.ffs@tglx>
MIME-Version: 1.0
Cc: markus.bloechl@ipetronik.com, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org,
 John Stultz <jstultz@google.com>,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
 Markus =?utf-8?Q?Bl=C3=B6chl?= <markus@blochl.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: intel: populate entire
 system_counterval_t in get_time_fn() callback
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

T24gU3VuLCBKdWwgMTMgMjAyNSBhdCAyMjoyMSwgTWFya3VzIEJsw7ZjaGwgd3JvdGU6Cj4gZ2V0
X3RpbWVfZm4oKSBjYWxsYmFjayBpbXBsZW1lbnRhdGlvbnMgYXJlIGV4cGVjdGVkIHRvIGZpbGwg
b3V0IHRoZQo+IGVudGlyZSBzeXN0ZW1fY291bnRlcnZhbF90IHN0cnVjdCBhcyBpdCBtYXkgYmUg
aW5pdGlhbGx5IHVuaW5pdGlhbGl6ZWQuCj4KPiBUaGlzIGJyb2tlIHdpdGggdGhlIHJlbW92YWwg
b2YgY29udmVydF9hcnRfdG9fdHNjKCkgaGVscGVyIGZ1bmN0aW9ucwo+IHdoaWNoIGxlZnQgdXNl
X25zZWNzIHVuaW5pdGlhbGl6ZWQuCgpTaWdoLiBBcyBJIGV4cGxhaW5lZCBpbiB0aGUgb3RoZXIg
dGhyZWFkLCB0aGUgcHJvcGVyIGZpeCBpcyB0bwp6ZXJvIGluaXRpYWxpemUgdGhlIGRhdGEgc3Ry
dWN0dXJlIGF0IHRoZSBjYWxsIHNpdGUgYW5kIGZpeCB0aGlzIHdob2xlCmNsYXNzIG9mIGlzc3Vl
cyBpbiBvbmUgZ28uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
