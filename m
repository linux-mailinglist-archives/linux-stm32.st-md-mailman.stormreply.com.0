Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMobMqNpoWkUsgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 10:53:39 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 781711B5979
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 10:53:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CB5FC87EC5;
	Fri, 27 Feb 2026 09:53:39 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 950ADC87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 09:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
 s=s1-ionos; t=1772185987; x=1772790787; i=marcel@ziswiler.com;
 bh=osg/KBiSHPE8q8+l4cSGrjz/3ljFNSwcPbponOZHnUQ=;
 h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MMiK2rh7VsX/zoQ4o0NwOJ6xEki7pxvTLDTlGiu+E2vFCNObT8kp7VJPwAZEaz/8
 Ogu3VZbkBObF8SnoiRN843KRe3xbCQwr3/fQmjlK+rq4H0utQhBJI25I8LOmtL+fo
 KurhjelHnxlNVM78cxaGejN9Nfh3PiiaVBsol942Dk255FsGuSiza0Ge40+MzOsGt
 tMhxDG6S5pOMZiIhWXjZ/YFizFS44HtyN2jkFV75kDeQeACNCqoP75HdY7F1EF+5W
 XGOQcaYmZ+aOAIZD/W8P5ZK0AWmF0fGKaEwTlYMh6w7L58a3AMOD+W3gkrZYoDhXQ
 rqotraS1FQPRnAyVQA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelay.perfora.net (mreueus004
 [74.208.5.2]) with ESMTPSA (Nemesis) id 1N4965-1vVGqJ3eDp-00rOlj; Fri, 27 Feb
 2026 10:53:07 +0100
Message-ID: <e2130fa8e18cdffb9be9426a8576e67675e87d55.camel@ziswiler.com>
From: Marcel Ziswiler <marcel@ziswiler.com>
To: =?UTF-8?Q?=E6=9D=8E=E5=BF=97?= <lizhi2@eswincomputing.com>
Date: Fri, 27 Feb 2026 10:52:55 +0100
In-Reply-To: <6137cd6a.4859.19c97f5eb67.Coremail.lizhi2@eswincomputing.com>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
 <5f99968ec561631852bfa72aea95a100dcad5324.camel@ziswiler.com>
 <6137cd6a.4859.19c97f5eb67.Coremail.lizhi2@eswincomputing.com>
User-Agent: Evolution 3.58.3 (by Flathub.org) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:P7rtaATGEKMWJFkzUg8ddjiTxi9RHPpZ3eAD8g5GykxXsfTcBTX
 8RXzCrhmAc5Vm8vo5y1jI0txTBr30Z6MJfl46iwascAdegNwXLF6TXOAfQRWSJB2uYY9XWl
 dt0tvp3HLYBjkGuG+00bNoMDBoNn6gZOOikO9YDx/ihQDYDOvNeLt1z5PGKPi6KVwwkcFPm
 LWc7lQqLeeV8Xby4TQxWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2aAsh0z8eO8=;1a+V6iI+Ks1SBDduFZaoA6b5djK
 3pmbvM9EWtriNKuicZvUI5AmVvd43284UVoaevjgNUSBPV36nB/7mxc4eDlCNUQph6dxQBuL4
 Ycr7eQJ3QSN/K1dZWCLtJS7fpXwBqChlRTXKqxA4t98XyQm8q7Jx6JC6GIqNhEdJqLCoSmQZi
 Cz+LKAK/hiCEw64OQ3l5Va8JXMmJX26a1U/WFux48O7/DghTcf+FifcEZm9OMWSwDPJ0WRCDh
 qvNsQUaVuFKusDrGC4ltb74acVwQNNhNhB8AX9J+aXXqOXvqqMEG3Uo91o2TO1pmniqju+K7Q
 RF6MqFY6yjVm1lqRpCa2TVySqtHmNjuQl7HyQR8M9XZvBwyKclpp65eIOD82kSxNwsKZAPAkx
 0/GfQhgkZ3nsRHyT4ASlDcsjUMG55SHMRwHb52IK63UlJ0eVpsE2G26wz3k+om0Ulr/5YsRJB
 ZZmRCXUzEHScAJ04gd0yctOGhg6+AsDAip0DYXuJDoB64TvmEyWO0XkowXdomVbatX6yo82aw
 nFAagbtvHoO97AIxgo9VfhMP6Rg6fe/UI5wMZHTKgiPVfHoxF7MMy4U0NfZu1+VpZ5jYjTJbx
 0Mm8j01Qofo8rWpK1uhfgmd0M/6LWN7EFbXMCdBXLprG+YmSsx8boRWLSC1vJ3GsxsKgn06kp
 ZzqmMZybqoXexY+y+lyGbJxB+iuLsd2EdFcqg+dP25wC8i+LlhSWizYouAdZ7lbVTxaA98zKp
 RBzcvMXZGNT6j+Ix/2fxK48YwJz1dIWlrX/UY+Un32ifhY8YWFkpbX5u+e+6zz3yJD6D3cTMu
 uve9lbYVnFJ7swcfR7wEeryrSsf3BGfuukHBtk8IBVD7fq9Bg+3uOfkRERtwFqjjGOm64Kmk+
 E+AHKM5pF2K6tRCIOCTQRHSIaCLTXPyvYlpBXgZaZRjyx08Tm4J1jk97kedDU1Zt9LKOpFUJz
 r+Nctqrgtyju+cZRQgZlYP3drW8xusEQJ3d06xXIGT3ahI28N1Ynwvt7XCPYQWFk6bLTs7Stj
 EnyklIa4U53kIYpwZPS7btQtE+N9WKZMcqqq9vL2FFnv0yZPIlm9W+55A6dVkRKFIr8HsCeIu
 vu5gw5PFZepe3GluE+HAm2pOmk5zo9NCan+CxkELxxOGNkkqthGnmY5+/eW5q/qpX12WWSmKX
 hPHw15Q0jC/de4zYcu8jpPdaJVk9OLkhRDejDs7RjQg9x0YOq8k6k83UJ/STzVlIrIuzYQnvo
 luAkUvfUV/H8bfJoZFAj22atQ0zm/CqPn2TiTLA99oNO3sTszglfC+HzFTw5nITzPO3He/ezm
 8v/bnaKh6/yckOWDcdqZkabQIPqgMAlGTkkzDc6jtZMsvgbv6WjpKjLsmq2/9n/+gjYG+SL9a
 kJFNkTNKrDGAuoLadQBVy5tWXjX/VqeLdxMqe0HZ++uxRekNsWx+5voj923XXmqjtWf2iAk0X
 7BQNPIli40Q496UTNbaveeD72ZwwF928ZWCDL/pvluaB+th+j5Q46HKdwlDTHUoXlcGPMK5JW
 illTnRP1btSRPCvmqBYME/DqAKzf7p8nuo+V4cbusgIuNXDcVE93w9GU0Wz17PjDfCV0VKA9T
 /AexslfP3O1GIlgRatK8Gy2hMa/XC/JV7IVwH3jF6DNaSiDWfqoF/1BfmugAyGspAsVs2us+5
 GjBoFUeyerviIjGb0QUzO3momKUvOReMVhff5aUXonxsyHZ+zYRcVr/XUAjZmjwz+ZX5V0VFT
 b17rImpNxujZUwSAlRyh5jfQANiMCGFcgYFwOMe9MEebeIaiURsnatGQ=
Cc: ganboing@gmail.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, dongxuyang@eswincomputing.com,
 robh@kernel.org, weishangjuan@eswincomputing.com, ningyu@eswincomputing.com,
 pritesh.patel@einfochips.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, rmk+kernel@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v2 0/2] net: stmmac: eic7700: fix EIC7700
 eth1 RX sampling timing
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ziswiler.com:s=s1-ionos];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[ziswiler.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:ganboing@gmail.com,m:edumazet@google.com,m:linux-stm32@st-md-mailman.stormreply.com,m:dongxuyang@eswincomputing.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:ningyu@eswincomputing.com,m:pritesh.patel@einfochips.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:rmk+kernel@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[marcel@ziswiler.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ziswiler.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marcel@ziswiler.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[gmail.com,google.com,st-md-mailman.stormreply.com,eswincomputing.com,kernel.org,einfochips.com,redhat.com,vger.kernel.org,armlinux.org.uk,lists.infradead.org,lunn.ch,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	NEURAL_SPAM(0.00)[0.432];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 781711B5979
X-Rspamd-Action: no action

SGkgWmhpIExpCgpPbiBUaHUsIDIwMjYtMDItMjYgYXQgMTE6MjAgKzA4MDAsIOadjuW/lyB3cm90
ZToKPiBIaSBNYXJjZWwsCj4gCj4gVGhhbmtzIGZvciBzaGFyaW5nIHRoZSBkZXRhaWxzLgo+IAo+
IDEuIEkgY2hlY2tlZCB5b3VyIGxvZyBhbmQgbm90aWNlZCB0aGF0IHRoZSBrZXJuZWwgY21kbGlu
ZSBhbHJlYWR5IGluY2x1ZGVzCj4gwqDCoCAiY2xrX2lnbm9yZV91bnVzZWQiLiBUaGVyZWZvcmUs
IHlvdXIgaXNzdWUgZG9lcyBub3QgYXBwZWFyIHRvIGJlIHRoZQo+IMKgwqAgc2FtZSBhcyB0aGUg
b25lIHByZXZpb3VzbHkgcmVwb3J0ZWQgYnkgQm8gR2FuLgoKWWVzLCB0aGF0IGFjdHVhbGx5IGNh
bWUgZnJvbSBFU1dJTidzIGhpZml2ZS1wcmVtaWVyLXA1NTBfZGVmY29uZmlnIHdoaWNoIEkgZGlz
YWJsZWQgbm93LgoKPiAyLiBJIGFsc28gdmVyaWZpZWQgdGhhdCB2Ni4xOS4yIGFscmVhZHkgY29u
dGFpbnMgdGhlIHR3byBlTU1DIGZpeCBwYXRjaGVzOgo+IMKgwqAgaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsL0NBUER5S0ZxY015TS09eCsyRldOTGhIWT1ndTVBcEhOUFFocDB4QktESkdyN0Jo
RXg0UUBtYWlsLmdtYWlsLmNvbS8KPiDCoMKgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9D
QVBEeUtGcmtFWkR1TWJHcGZ4aXNtY3g9dkprU1NLX1hidEI3NjIrc1VGb2N1cFQ2M3dAbWFpbC5n
bWFpbC5jb20vCgpZZXMuCgo+IMKgwqAgQSBsaWtlbHkgY2F1c2UgaXMgdGhhdCB0aGUgZU1NQyBE
VFMgbm9kZSBpcyBtaXNzaW5nIHRoZSBBWEkgY2xvY2sgZGVmaW5pdGlvbi4KPiDCoMKgIFBsZWFz
ZSByZWZlciB0byB0aGUgRFRTIHVwZGF0ZXMgaW4gdGhlIGZvbGxvd2luZyBwdWxsIHJlcXVlc3Qg
Zm9yIHJlZmVyZW5jZToKPiDCoMKgIGh0dHBzOi8vZ2l0aHViLmNvbS9lc3dpbmNvbXB1dGluZy9s
aW51eC1uZXh0L3B1bGwvMjAKCkFoLCB0aGF0IG9uZSBoZWxwZWQgKDstcCkuCgpCVFc6IEZvciBD
UFUgZnJlcXVlbmN5IHNjYWxpbmcgdG8gYWN0dWFsbHkgd29yayBvbmUgbWF5IGFkZGl0aW9uYWxs
eSBuZWVkIENPTkZJR19SSVNDVl9TQklfQ1BVSURMRT15LgoKPiAzLiBJbiBhZGRpdGlvbiwgcGxl
YXNlIGNoZWNrIHdoZXRoZXIgQ09ORklHX0dQSU9fRFdBUEI9eSBpcyBlbmFibGVkIGluIHlvdXIK
PiDCoMKgIGtlcm5lbCBjb25maWd1cmF0aW9uLiBTaW5jZSBHTUFDIGlzIGJ1aWx0LWluIGJ5IGRl
ZmF1bHQsIGl0IGRlcGVuZHMgb24KPiDCoMKgIEdQSU8gYmVpbmcgYXZhaWxhYmxlIGR1cmluZyBl
YXJseSBpbml0aWFsaXphdGlvbi4KClllcywgSSBhbHNvIGNoYW5nZWQgdGhhdCBmcm9tID1tIHRv
ID15ICg7LXApLgoKPiBIb3BlIHRoaXMgaGVscHMgbmFycm93IHRoaW5ncyBkb3duLiBQbGVhc2Ug
bGV0IG1lIGtub3cgd2hhdCB5b3UgZmluZC4KClllcywgaXQgYWxsIHdvcmtzIG5vdyBwZXJmZWN0
bHkgaW5jbC4gQ1BVIGZyZXF1ZW5jeSBzY2FsaW5nLiBTZWUgWzFdLgoKTmV4dCBvbmUgd291bGQg
YmUgd29ya2luZyBQQ0llIGFuZCBVU0IuIFVuZm9ydHVuYXRlbHksIGZvciBQQ0llIG9uIEVCQzc3
IG9uZSB3b3VsZCBsaWtlbHkgbmVlZCBzb21lIHNvcnQgb2YgYW4KYWRhcHRlciBjYWJsZS9QQ0Iu
IE1heWJlIEkgY2FuIHNvbGRlciBzb21ldGhpbmcgdG9nZXRoZXIuIExldCdzIHNlZS4uLgoKVGhh
bmsgeW91IHZlcnkgbXVjaCEKClsxXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvbWV0YS1yaXNj
di9wdWxsLzYwMgoKPiBCZXN0IHJlZ2FyZHMsCj4gWmhpIExpCgpDaGVlcnMKCk1hcmNlbAoKPiA+
IC0tLS0t5Y6f5aeL6YKu5Lu2LS0tLS0KPiA+IOWPkeS7tuS6ujogIk1hcmNlbCBaaXN3aWxlciIg
PG1hcmNlbEB6aXN3aWxlci5jb20+Cj4gPiDlj5HpgIHml7bpl7Q6MjAyNi0wMi0yMSAwMjozNzo1
NyAo5pif5pyf5YWtKQo+ID4g5pS25Lu25Lq6OiBsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tLCBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZywgYW5kcmV3K25ldGRldkBsdW5uLmNoLCBkYXZlbUBk
YXZlbWxvZnQubmV0LAo+ID4gZWR1bWF6ZXRAZ29vZ2xlLmNvbSwga3ViYUBrZXJuZWwub3JnLCBy
b2JoQGtlcm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywK
PiA+IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcsIHBhYmVuaUByZWRoYXQuY29tLCBtY29xdWVsaW4u
c3RtMzJAZ21haWwuY29tLCBhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tLAo+ID4gcm1rK2tl
cm5lbEBhcm1saW51eC5vcmcudWssIGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20sIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZywKPiA+IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiA+IOaKhOmAgTogbmluZ3l1QGVzd2luY29tcHV0aW5nLmNv
bSwgbGlubWluQGVzd2luY29tcHV0aW5nLmNvbSwgcGlua2VzaC52YWdoZWxhQGVpbmZvY2hpcHMu
Y29tLAo+ID4gd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0aW5nLmNvbSwgZG9uZ3h1eWFuZ0Blc3dp
bmNvbXB1dGluZy5jb20KPiA+IOS4u+mimDogUmU6IFtQQVRDSCB2MiAwLzJdIG5ldDogc3RtbWFj
OiBlaWM3NzAwOiBmaXggRUlDNzcwMCBldGgxIFJYIHNhbXBsaW5nIHRpbWluZwo+ID4gCj4gPiBI
aSBaaGkgTGkKPiA+IAo+ID4gU29ycnksIHRvIHN0ZWFsIHRoaXMgdGhyZWFkLCBidXQgSSBkbyBo
YXZlIGEgcXVpY2sgcXVlc3Rpb24gY29uY2VybmluZyBFdGhlcm5ldCBvbiB0aGUgRUlDNzcwMC4g
RXZlcnkgdGltZQo+ID4gSQo+ID4gZW5hYmxlIGdtYWMwIGluIHRoZSBkZXZpY2UgdHJlZSBteSBF
QkM3NzAwIHN0b3BzIGJvb3RpbmcgKGUuZy4gU0QgY2FyZCBpcyBubyBsb25nZXIgZGV0ZWN0ZWQp
IHdoaWxlCj4gPiBFdGhlcm5ldAo+ID4gZG9lcyBzZWVtIHRvIGF0IGxlYXN0IGdldCBkZXRlY3Rl
ZC4gVGhpcyBoYXMgYmVlbiBzZWVuIHVzaW5nIG5leHQtMjAyNjAyMTksIHN0YWJsZSB2Ni4xOS4y
IFsxXSBhcyB3ZWxsIGFzCj4gPiA2LjE4LjAtcmM2IFsyXS4gQW55IGlkZWEgd2hhdCBjb3VsZCBi
ZSBnb2luZyB3cm9uZz8KPiA+IAo+ID4gSSBhZG1pdCBzbyBmYXIgSSBvbmx5IGRvIGhhdmUgb25l
IHNpbmdsZSBFQkM3NzAwIGF0IGhhbmQgd2hpbGUgd2FpdGluZyBmb3IgZnVydGhlciBoYXJkd2Fy
ZSB0byBhcnJpdmUuCj4gPiAKPiA+IFRoYW5rcyEKPiA+IAo+ID4gWzFdIGh0dHBzOi8vZ2l0aHVi
LmNvbS9yaXNjdi9tZXRhLXJpc2N2L3B1bGwvNjAxCj4gPiBbMl0gaHR0cHM6Ly9naXRodWIuY29t
L2Vzd2luY29tcHV0aW5nL2xpbnV4LW5leHQvdHJlZS9kZXYvdGVzdC11cHN0cmVhbS12Ni4xOC1y
YzYKPiA+IAo+ID4gQ2hlZXJzCj4gPiAKPiA+IE1hcmNlbAo+ID4gCj4gPiBbc25pcF0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
