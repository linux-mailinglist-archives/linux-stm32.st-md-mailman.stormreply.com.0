Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EA49B4A21
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 13:50:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47622C71290;
	Tue, 29 Oct 2024 12:50:19 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30831C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 12:50:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B976A1C0006;
 Tue, 29 Oct 2024 12:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730206211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gB3WSdXjO7v/Iei9P2xSNx89xruiqhNe99fDC+mG5Po=;
 b=g28+V//iv+dZW0GMwuHLqnAZLIYhrPMLE/30kYpzXbU7iSDONAE1h8nzDO1/zqxtJ2RP6/
 aFtkb9n8pfM5Sl8keTKm6+06VRwzs2MjQE59ywRQzU+P8zsG5CkGN/N1OpcHY7zhR91WfZ
 Ni0W3Frrw1x0asdiWU4VLTLkVC/fNDFhIZ4GVYXBAiu30H9KumYpIInvZaQ5fNzx4ygIoH
 eCH+gsa74e/NfromDTeQJ9mleEDF4PIoPeBtr3zrvJsUORUof8E/+IZQ/sanSp63RfN7g1
 mLpzBjNlQ9IpY21e0ABIMQ6S2IhxnwyOR8Co7II0RGjR/eraRfg36zm9ZrE5pA==
Message-ID: <1ca44f81-8c09-4745-939b-a29699fb937b@bootlin.com>
Date: Tue, 29 Oct 2024 13:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
References: <20241029115419.1160201-1-maxime.chevallier@bootlin.com>
 <20241029115419.1160201-4-maxime.chevallier@bootlin.com>
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Language: en-US
In-Reply-To: <20241029115419.1160201-4-maxime.chevallier@bootlin.com>
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/7] net: stmmac: Only update the
 auto-discovered PTP clock features
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

SGVsbG8gTWF4aW1lLAp0aGFua3MgZm9yIHJldml2aW5nIHRoaXMgIQoKT24gMTAvMjkvMjQgMTI6
NTQsIE1heGltZSBDaGV2YWxsaWVyIHdyb3RlOgo+IFNvbWUgRFdNQUMgdmFyaWFudHMgc3VjaCBh
cyBkd21hYzEwMDAgZG9uJ3Qgc3VwcG9ydCBkaXNvdmVyaW5nIHRoZQo+IG51bWJlciBvZiBvdXRw
dXQgcHBzIGFuZCBhdXhpbGlhcnkgc25hcHNob3RzLiBBbGxvdyB0aGVzZSBwYXJhbWV0ZXJzIHRv
Cj4gYmUgZGVmaW5lZCBpbiBkZWZhdWx0IHB0cF9jbG9ja19pbmZvLCBhbmQgbGV0IHRoZW0gYmUg
dXBkYXRlZCBvbmx5IHdoZW4KPiB0aGUgZmVhdHVyZSBkaXNjb3ZlcnkgeWllbGRlZCBhIHJlc3Vs
dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgQ2hldmFsbGllciA8bWF4aW1lLmNoZXZhbGxp
ZXJAYm9vdGxpbi5jb20+CgpuaXQ6IHMvZGlzb3ZlcmluZy9kaXNjb3ZlcmluZy8KClRoYW5rcywK
QWxleGlzCgotLSAKQWxleGlzIExvdGhvcsOpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBL
ZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
