Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7349C6B95D7
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 14:18:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CAD4C65E60;
	Tue, 14 Mar 2023 13:18:43 +0000 (UTC)
Received: from mail.sgstbr.de (mail.sgstbr.de [94.130.16.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9ECF1C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 09:56:12 +0000 (UTC)
Received: from [IPV6:2a02:810d:ab40:2500:3b46:4127:c750:bf0] (unknown
 [IPv6:2a02:810d:ab40:2500:3b46:4127:c750:bf0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: fabian@blaese.de)
 by mail.sgstbr.de (Postfix) with ESMTPSA id 4778C248C26;
 Tue, 14 Mar 2023 10:56:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blaese.de; s=201803;
 t=1678787772; bh=yWcoB4tVZlJzYKHd4ly9wNaGuCzR7+nWR+G7gkbfJvk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=pNpDr1rBumEWK7kpBbgQwV6sZSB0iH2Uv//13GnMlr9JVyygjuCd5+TDWJbXpRQvO
 FO05V7qcbyjT1R+UcCdQt1aThhPiVuP0bV2GQEsiFH+LJKqKJFZs+cDVGaYBjltun/
 bGKV9N6qts6w6MSAhHmhPYf+GAQahXVetJSO+mGA/U0XG0LyGiow8PsRVO/1JnVISV
 /SJUQz9ikMDKnvIjEtKyvNzoUOAOcLF5YqQhsaXLfPiYlFebTR+5gRoIjSDChn+jxf
 Nvq2CtOLNW0294X4SoJ/JdgwtyZhfEMLN+KUQZlRgBW54DcJxw9Dmk5EIUvH2a9DO/
 MuFLPed4kheqA==
Message-ID: <cc5883b7-e48e-80a3-8797-eb941405cd17@blaese.de>
Date: Tue, 14 Mar 2023 10:56:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: de-DE
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230314070208.3703963-1-michael.wei.hong.sit@intel.com>
 <20230314070208.3703963-2-michael.wei.hong.sit@intel.com>
From: =?UTF-8?Q?Fabian_Bl=c3=a4se?= <fabian@blaese.de>
In-Reply-To: <20230314070208.3703963-2-michael.wei.hong.sit@intel.com>
X-Mailman-Approved-At: Tue, 14 Mar 2023 13:18:41 +0000
Cc: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Voon Weifeng <weifeng.voon@intel.com>
Subject: Re: [Linux-stm32] [PATCH net v2 1/2] net: stmmac: fix PHY handle
	parsing
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

T24gMTQuMDMuMjMgMDg6MDIsIE1pY2hhZWwgU2l0IFdlaSBIb25nIHdyb3RlOgo+IHBoeWxpbmtf
Zndub2RlX3BoeV9jb25uZWN0IHJldHVybnMgMCB3aGVuIHNldCB0byBNTE9fQU5fSU5CQU5ELgo+
IFRoaXMgY2F1c2VzIHRoZSBQSFkgaGFuZGxlIHBhcnNpbmcgdG8gc2tpcCBhbmQgdGhlIFBIWSB3
aWxsIG5vdCBiZSBhdHRhY2hlZAo+IHRvIHRoZSBNQUMuCj4gCj4gQWRkIGFkZGl0aW9uYWwgY2hl
Y2sgZm9yIFBIWSBoYW5kbGUgcGFyc2luZyB3aGVuIHNldCB0byBNTE9fQU5fSU5CQU5ELgo+IAo+
IEZpeGVzOiBhYjIxY2Y5MjA5MjggKCJuZXQ6IHN0bW1hYzogbWFrZSBtZGlvIHJlZ2lzdGVyIHNr
aXBzIFBIWSBzY2FubmluZyBmb3IgZml4ZWQtbGluayIpCj4gU2lnbmVkLW9mZi1ieTogTWljaGFl
bCBTaXQgV2VpIEhvbmcgPG1pY2hhZWwud2VpLmhvbmcuc2l0QGludGVsLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBMYWkgUGV0ZXIgSnVuIEFubiA8cGV0ZXIuanVuLmFubi5sYWlAaW50ZWwuY29tPgoK
VGVzdGVkLWJ5OiBGYWJpYW4gQmzDpHNlIDxmYWJpYW5AYmxhZXNlLmRlPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
