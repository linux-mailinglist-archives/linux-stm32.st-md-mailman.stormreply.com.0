Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JnJBOSl22meEgkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Apr 2026 16:02:12 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9045C3E41FF
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Apr 2026 16:02:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15BCCC8F266;
	Sun, 12 Apr 2026 14:02:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9126EC87ED1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Apr 2026 14:02:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9F15F4E425B6;
 Sun, 12 Apr 2026 14:02:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 72DEA5FFB9;
 Sun, 12 Apr 2026 14:02:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E243710450084; 
 Sun, 12 Apr 2026 16:02:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776002527; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=JyrBejDYNW+FyCRkORkAaICvUo5I+HducgLjouVMK8Q=;
 b=H1SHUp2R7XPwq9Y3NwXMRHFL9rv7/aMub8BCAbRoGsvkYB4u71U8GqMr0QXdounn2viENY
 zw3G2x+z9Klw5QjfVdizmvk0jI7B04AX8ZpmqkoYXAbeFu1wJzDgkp71lYhIS4ii9K1DLO
 2vBkQPe+HymDPy73T1Zt7U+JzMzxPhWnTmACykWg7uU2kaUg26+Hy7YmTEntANuVJwSI5Z
 fp/Nj7T8u6mUUN5VVT1D2vLWHunbpjWtrvRheLGMv9Hgjr9ibBUmcBN5hRHNkJy8NSyNam
 n/pWT7WmiWvqGU8UnIetUuUX+/iR4SESagBhFHwYVzPsr6Qoq71fhkwp2d1B+A==
Message-ID: <266998d8-7e38-4bae-a4df-2f889538fe88@bootlin.com>
Date: Sun, 12 Apr 2026 16:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Sam Edwards <cfsworks@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: enable RPS and RBU
	interrupts
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
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:cfsworks@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.195];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 9045C3E41FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgUnVzc2VsbCwKCk9uIDEwLzA0LzIwMjYgMTU6MDcsIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3
cm90ZToKPiBFbmFibGUgcmVjZWl2ZSBwcm9jZXNzIHN0b3BwZWQgYW5kIHJlY2VpdmUgYnVmZmVy
IHVuYXZhaWxhYmxlCj4gaW50ZXJydXB0cywgc28gdGhhdCB0aGUgc3RhdGlzdGljIGNvdW50ZXJz
IGNhbiBiZSB1cGRhdGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xl
KSA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+Cj4gLS0tCj4gU2luY2Ugd2UgYXJlIHNlZWlu
ZyByZWNlaXZlIGJ1ZmZlciBleGhhdXN0aW9uIG9uIHNldmVyYWwgcGxhdGZvcm1zLAo+IGxldCdz
IGVuYWJsZSB0aGUgaW50ZXJydXB0cyBzbyB0aGUgc3RhdGlzdGljcyB3ZSBwdWJsaXNoIHZpYSBl
dGh0b29sIC1TCj4gYWN0dWFsbHkgd29yayB0byBhaWQgZGlhZ25vc2lzLiBJJ3ZlIGJlZW4gaW4g
dHdvIG1pbmRzIGFib3V0IHdoZXRoZXIKPiB0byBzZW5kIHRoaXMgcGF0Y2gsIGJ1dCBnaXZlbiB0
aGUgcHJvYmxlbXMgd2l0aCBzdG1tYWMgYXQgdGhlIG1vbWVudCwKPiBJIHRoaW5rIGl0IHNob3Vs
ZCBiZSBtZXJnZWQuCgpMb29rcyBsaWtlIG15IHJlcGx5IHRvIHlvdXIgb3JpZ2luYWwgUkZDIHdh
cyBsb3N0IGluIGxpbWJvIGFzIHRoZSByZXZpZXcvdGVzdCB0YWdzIGFyZSBtaXNzaW5nLgoKSGVy
ZSdzIG15IG9yaWdpbmFsIGFuc3dlciA6CgoKSXQgd29ya3MsIEkgY2FuIGluZGVlZCBzZWUgdGhl
IHN0YXRzIGdldCBwcm9wZXJseSB1cGRhdGVkIG9uIGlteDhtcCDwn5mCCgpUaGVyZSdzIG9uZSBk
b3duc2lkZSB0byBpdCB0aG91Z2gsIHdoaWNoIGlzIHRoYXQgYXMgc29vbiBhcyB3ZSBoaXQgYSBz
aXR1YXRpb24Kd2hlcmUgd2UgZG9uJ3QgaGF2ZSBSWCBidWZzIGF2YWlsYWJsZSwgdGhpcyBwYXRj
aHMgaGFzIGEgdGVuZGFuY3kgdG8gbWFrZSB0aGluZ3MKd29yc2UgYXMgd2UnbGwgdHJpZ2dlciBp
bnRlcnJ1cHRzIGZvciBlYWNoIHBhY2tldCB3ZSByZWNlaXZlIGFuZCB0aGF0IHdlIGNhbid0CnBy
b2Nlc3MsIG1ha2luZyBpdCBldmVuIGxvbmdlciBmb3IgcXVldWVzIHRvIGJlIHJlZmlsbGVkLgoK
SXQgc2hvd3Mgb24gaXBlcmYzIHdpdGggc21hbGwgcGFja2V0cyA6CgotLS0tIEJlZm9yZSBwYXRj
aCwgMTclIHBhY2tldCBsb3NzIG9uIFVEUCA1NiBieXRlcyBwYWNrZXRzIC0tLS0tLS0tLS0tLS0t
LS0tCgojIGlwZXJmMyAtdSAtYiAwIC1sIDU2IC1jIDE5Mi4xNjguMi4xIC1SCkNvbm5lY3Rpbmcg
dG8gaG9zdCAxOTIuMTY4LjIuMSwgcG9ydCA1MjAxClJldmVyc2UgbW9kZSwgcmVtb3RlIGhvc3Qg
MTkyLjE2OC4yLjEgaXMgc2VuZGluZwpbICA1XSBsb2NhbCAxOTIuMTY4LjIuMTggcG9ydCA0Nzg1
MSBjb25uZWN0ZWQgdG8gMTkyLjE2OC4yLjEgcG9ydCA1MjAxClsgSURdIEludGVydmFsICAgICAg
ICAgICBUcmFuc2ZlciAgICAgQml0cmF0ZSAgICAgICAgIEppdHRlciAgICBMb3N0L1RvdGFsIERh
dGFncmFtcwpbICA1XSAgIDAuMDAtMS4wMCAgIHNlYyAgMTAuNyBNQnl0ZXMgIDkwLjAgTWJpdHMv
c2VjICAwLjAwMyBtcyAgNDg1NTAvMjQ5NjUwICgxOSUpICAKWyAgNV0gICAxLjAwLTIuMDAgICBz
ZWMgIDExLjMgTUJ5dGVzICA5NS4wIE1iaXRzL3NlYyAgMC4wMDMgbXMgIDQxODgxLzI1MzgzMiAo
MTYlKSAgClsgIDVdICAgMi4wMC0zLjAwICAgc2VjICAxMS4zIE1CeXRlcyAgOTQuOSBNYml0cy9z
ZWMgIDAuMDAyIG1zICA0MjA2MC8yNTM5MTMgKDE3JSkgIApbICA1XSAgIDMuMDAtNC4wMCAgIHNl
YyAgMTEuMyBNQnl0ZXMgIDk1LjEgTWJpdHMvc2VjICAwLjAwMyBtcyAgNDE0OTkvMjUzNzg1ICgx
NiUpICAKWyAgNV0gICA0LjAwLTUuMDAgICBzZWMgIDExLjMgTUJ5dGVzICA5NC42IE1iaXRzL3Nl
YyAgMC4wMDMgbXMgIDQyNjYzLzI1Mzc4NyAoMTclKSAgClsgIDVdICAgNS4wMC02LjAwICAgc2Vj
ICAxMS4zIE1CeXRlcyAgOTQuOSBNYml0cy9zZWMgIDAuMDA2IG1zICA0MTk3Ni8yNTM3MTkgKDE3
JSkgIApbICA1XSAgIDYuMDAtNy4wMCAgIHNlYyAgMTEuMyBNQnl0ZXMgIDk0LjUgTWJpdHMvc2Vj
ICAwLjAwMyBtcyAgNDMxMzMvMjUzOTk5ICgxNyUpICAKWyAgNV0gICA3LjAwLTguMDAgICBzZWMg
IDExLjMgTUJ5dGVzICA5NS4wIE1iaXRzL3NlYyAgMC4wMDQgbXMgIDQxNDQyLzI1MzU3OSAoMTYl
KSAgClsgIDVdICAgOC4wMC05LjAwICAgc2VjICAxMS40IE1CeXRlcyAgOTUuMiBNYml0cy9zZWMg
IDAuMDA0IG1zICA0MTUxOC8yNTQxMzEgKDE2JSkgIApbICA1XSAgIDkuMDAtMTAuMDAgIHNlYyAg
MTEuMiBNQnl0ZXMgIDk0LjMgTWJpdHMvc2VjICAwLjAwNiBtcyAgNDM1ODAvMjU0MTQzICgxNyUp
ICAKLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLQpbIElE
XSBJbnRlcnZhbCAgICAgICAgICAgVHJhbnNmZXIgICAgIEJpdHJhdGUgICAgICAgICBKaXR0ZXIg
ICAgTG9zdC9Ub3RhbCBEYXRhZ3JhbXMKWyAgNV0gICAwLjAwLTEwLjAwICBzZWMgICAxMzUgTUJ5
dGVzICAgMTE0IE1iaXRzL3NlYyAgMC4wMDAgbXMgIDAvMCAoMCUpICBzZW5kZXIKWyAgNV0gICAw
LjAwLTEwLjAwICBzZWMgICAxMTIgTUJ5dGVzICA5NC4zIE1iaXRzL3NlYyAgMC4wMDYgbXMgIDQy
ODMwMi8yNTM0NTM4ICgxNyUpICByZWNlaXZlcgoKaXBlcmYgRG9uZS4KIyBldGh0b29sIC1TIGV0
aDEgfCBncmVwIHJ4X2J1Zl91bmF2X2lycQogICAgIHJ4X2J1Zl91bmF2X2lycTogMAoKLS0tLSBB
ZnRlciBwYXRjaCwgMjIlIHBhY2tldCBsb3NzIG9uIFVEUCA1NiBieXRlcyBwYWNrZXRzIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KCiMgaXBlcmYzIC11IC1iIDAgLWwgNTYgLWMgMTkyLjE2OC4yLjEg
LVIKQ29ubmVjdGluZyB0byBob3N0IDE5Mi4xNjguMi4xLCBwb3J0IDUyMDEKUmV2ZXJzZSBtb2Rl
LCByZW1vdGUgaG9zdCAxOTIuMTY4LjIuMSBpcyBzZW5kaW5nClsgIDVdIGxvY2FsIDE5Mi4xNjgu
Mi4xOCBwb3J0IDQyMTIxIGNvbm5lY3RlZCB0byAxOTIuMTY4LjIuMSBwb3J0IDUyMDEKWyBJRF0g
SW50ZXJ2YWwgICAgICAgICAgIFRyYW5zZmVyICAgICBCaXRyYXRlICAgICAgICAgSml0dGVyICAg
IExvc3QvVG90YWwgRGF0YWdyYW1zClsgIDVdICAgMC4wMC0xLjAwICAgc2VjICAxMC4zIE1CeXRl
cyAgODUuOCBNYml0cy9zZWMgIDAuMDA0IG1zICA1NTE0Ni8yNDcxNzIgKDIyJSkgIApbICA1XSAg
IDEuMDAtMi4wMCAgIHNlYyAgMTAuNiBNQnl0ZXMgIDg5LjEgTWJpdHMvc2VjICAwLjAwMyBtcyAg
NTQ2OTkvMjUzMzU1ICgyMiUpICAKWyAgNV0gICAyLjAwLTMuMDAgICBzZWMgIDEwLjYgTUJ5dGVz
ICA4OS4wIE1iaXRzL3NlYyAgMC4wMDMgbXMgIDU1MjMxLzI1Mzg4NyAoMjIlKSAgClsgIDVdICAg
My4wMC00LjAwICAgc2VjICAxMC42IE1CeXRlcyAgODguOSBNYml0cy9zZWMgIDAuMDAzIG1zICA1
NTEzOC8yNTM2MDIgKDIyJSkgIApbICA1XSAgIDQuMDAtNS4wMCAgIHNlYyAgMTAuNiBNQnl0ZXMg
IDg5LjAgTWJpdHMvc2VjICAwLjAwMyBtcyAgNTQ5MzgvMjUzNzIyICgyMiUpICAKWyAgNV0gICA1
LjAwLTYuMDAgICBzZWMgIDEwLjYgTUJ5dGVzICA4OC45IE1iaXRzL3NlYyAgMC4wMDMgbXMgIDU1
MjczLzI1MzU4MCAoMjIlKSAgClsgIDVdICAgNi4wMC03LjAwICAgc2VjICAxMC42IE1CeXRlcyAg
ODkuMCBNYml0cy9zZWMgIDAuMDAzIG1zICA1NTIwMi8yNTM5ODYgKDIyJSkgIApbICA1XSAgIDcu
MDAtOC4wMCAgIHNlYyAgMTAuNiBNQnl0ZXMgIDg5LjEgTWJpdHMvc2VjICAwLjAwMyBtcyAgNTUw
NDcvMjUzOTU4ICgyMiUpICAKWyAgNV0gICA4LjAwLTkuMDAgICBzZWMgIDEwLjYgTUJ5dGVzICA4
OC45IE1iaXRzL3NlYyAgMC4wMDMgbXMgIDU1NjEyLzI1NDE0MCAoMjIlKSAgClsgIDVdICAgOS4w
MC0xMC4wMCAgc2VjICAxMC42IE1CeXRlcyAgODkuMCBNYml0cy9zZWMgIDAuMDAzIG1zICA1NTY4
My8yNTQ0MDMgKDIyJSkgIAotIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0g
LSAtIC0gLSAtClsgSURdIEludGVydmFsICAgICAgICAgICBUcmFuc2ZlciAgICAgQml0cmF0ZSAg
ICAgICAgIEppdHRlciAgICBMb3N0L1RvdGFsIERhdGFncmFtcwpbICA1XSAgIDAuMDAtMTAuMDAg
IHNlYyAgIDEzNSBNQnl0ZXMgICAxMTMgTWJpdHMvc2VjICAwLjAwMCBtcyAgMC8wICgwJSkgIHNl
bmRlcgpbICA1XSAgIDAuMDAtMTAuMDAgIHNlYyAgIDEwNiBNQnl0ZXMgIDg4LjcgTWJpdHMvc2Vj
ICAwLjAwMyBtcyAgNTUxOTY5LzI1MzE4MDUgKDIyJSkgIHJlY2VpdmVyCgppcGVyZiBEb25lLgoj
IGV0aHRvb2wgLVMgZXRoMSB8IGdyZXAgcnhfYnVmX3VuYXZfaXJxCiAgICAgcnhfYnVmX3VuYXZf
aXJxOiAzMDYyNAoKClNvIGNsZWFybHkgdGhlcmUgYXJlIHByb3MgYW5kIGNvbnMgd2l0aCB0aGlz
LCBidXQgSSBkb24ndCB3YW50IHRvIGZhbGwgaW50byB0aGUKImxldCdzIG5vdCBicmVhayBtaWNy
b2JlbmNobWFya3MiIHBpdGZhbGwuCgpJIHBlcnNvbm5hbHkgZmluZCB0aGUgc3RhdCB1c2VmdWws
IGFuZCB0aGF0IGhhdmluZyB0aGUgc3RhdCB2aXNpYmxlIHRvIHVzZXIKYnV0IHN0dWNrIGF0IDAg
aXMgbWlzbGVhZGluZyBzbywKClRlc3RlZC1ieTogTWF4aW1lIENoZXZhbGxpZXIgPG1heGltZS5j
aGV2YWxsaWVyQGJvb3RsaW4uY29tPgpSZXZpZXdlZC1ieTogTWF4aW1lIENoZXZhbGxpZXIgPG1h
eGltZS5jaGV2YWxsaWVyQGJvb3RsaW4uY29tPgoKCk1heGltZQoKPiAKPiAgZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWM0X2RtYS5oIHwgNiArKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYzRfZG1hLmggYi9kcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9kd21hYzRfZG1hLmgKPiBpbmRleCBhZjY1ODAzMzJkNDkuLjQzYjAz
NmQ0ZTk1YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9kd21hYzRfZG1hLmgKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9kd21hYzRfZG1hLmgKPiBAQCAtOTksNiArOTksOCBAQCBzdGF0aWMgaW5saW5lIHUzMiBkbWFf
Y2hhbnhfYmFzZV9hZGRyKGNvbnN0IHN0cnVjdCBkd21hYzRfYWRkcnMgKmFkZHJzLAo+ICAjZGVm
aW5lIERNQV9DSEFOX0lOVFJfRU5BX05JRV80XzEwCUJJVCgxNSkKPiAgI2RlZmluZSBETUFfQ0hB
Tl9JTlRSX0VOQV9BSUVfNF8xMAlCSVQoMTQpCj4gICNkZWZpbmUgRE1BX0NIQU5fSU5UUl9FTkFf
RkJFCQlCSVQoMTIpCj4gKyNkZWZpbmUgRE1BX0NIQU5fSU5UUl9FTkFfUlBTCQlCSVQoOCkKPiAr
I2RlZmluZSBETUFfQ0hBTl9JTlRSX0VOQV9SQlUJCUJJVCg3KQo+ICAjZGVmaW5lIERNQV9DSEFO
X0lOVFJfRU5BX1JJRQkJQklUKDYpCj4gICNkZWZpbmUgRE1BX0NIQU5fSU5UUl9FTkFfVElFCQlC
SVQoMCkKPiAgCj4gQEAgLTEwNyw2ICsxMDksOCBAQCBzdGF0aWMgaW5saW5lIHUzMiBkbWFfY2hh
bnhfYmFzZV9hZGRyKGNvbnN0IHN0cnVjdCBkd21hYzRfYWRkcnMgKmFkZHJzLAo+ICAJCQkJCSBE
TUFfQ0hBTl9JTlRSX0VOQV9USUUpCj4gIAo+ICAjZGVmaW5lIERNQV9DSEFOX0lOVFJfQUJOT1JN
QUwJCShETUFfQ0hBTl9JTlRSX0VOQV9BSUUgfCBcCj4gKwkJCQkJIERNQV9DSEFOX0lOVFJfRU5B
X1JQUyB8IFwKPiArCQkJCQkgRE1BX0NIQU5fSU5UUl9FTkFfUkJVIHwgXAo+ICAJCQkJCSBETUFf
Q0hBTl9JTlRSX0VOQV9GQkUpCj4gIC8qIERNQSBkZWZhdWx0IGludGVycnVwdCBtYXNrIGZvciA0
LjAwICovCj4gICNkZWZpbmUgRE1BX0NIQU5fSU5UUl9ERUZBVUxUX01BU0sJKERNQV9DSEFOX0lO
VFJfTk9STUFMIHwgXAo+IEBAIC0xMTcsNiArMTIxLDggQEAgc3RhdGljIGlubGluZSB1MzIgZG1h
X2NoYW54X2Jhc2VfYWRkcihjb25zdCBzdHJ1Y3QgZHdtYWM0X2FkZHJzICphZGRycywKPiAgCQkJ
CQkgRE1BX0NIQU5fSU5UUl9FTkFfVElFKQo+ICAKPiAgI2RlZmluZSBETUFfQ0hBTl9JTlRSX0FC
Tk9STUFMXzRfMTAJKERNQV9DSEFOX0lOVFJfRU5BX0FJRV80XzEwIHwgXAo+ICsJCQkJCSBETUFf
Q0hBTl9JTlRSX0VOQV9SUFMgfCBcCj4gKwkJCQkJIERNQV9DSEFOX0lOVFJfRU5BX1JCVSB8IFwK
PiAgCQkJCQkgRE1BX0NIQU5fSU5UUl9FTkFfRkJFKQo+ICAvKiBETUEgZGVmYXVsdCBpbnRlcnJ1
cHQgbWFzayBmb3IgNC4xMGEgKi8KPiAgI2RlZmluZSBETUFfQ0hBTl9JTlRSX0RFRkFVTFRfTUFT
S180XzEwCShETUFfQ0hBTl9JTlRSX05PUk1BTF80XzEwIHwgXAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
