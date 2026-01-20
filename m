Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL/1FpH9b2mUUgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 23:11:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E34574CCB6
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 23:11:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B23EC3F944;
	Tue, 20 Jan 2026 22:11:28 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8FB4C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 22:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=cz8APhsseY0Zk6G5E1jpmPu9bX8/ov5VZe6gD1zzSmc=; b=0W
 Lm9SWQQov5SYd420XUzSP8tyaiF9Y4ujlBQzmY/Th4asNTZ50ub3BJd9Dlsrxalzcy+e9smXDK7uN
 NqKWIJLS3Yz9jukT5jfXlgISuHH38T+Dy7aAeX+CrQxUfBfk/HmRYj7G1QITxRhI94jWTECv3vxjD
 lw4a8v0h3Xo2qJY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1viJw7-003jIq-CF; Tue, 20 Jan 2026 23:10:55 +0100
Date: Tue, 20 Jan 2026 23:10:55 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Message-ID: <2e3f213b-d507-4290-91af-fba7492155d2@lunn.ch>
References: <20260119073342.3132502-1-a0987203069@gmail.com>
 <20260119073342.3132502-3-a0987203069@gmail.com>
 <04df4909-4fdb-4046-917f-2f2e47832c62@lunn.ch>
 <a5cb949f-34c1-470c-bd04-0b35c249455f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5cb949f-34c1-470c-bd04-0b35c249455f@gmail.com>
Cc: ychuang3@nuvoton.com, edumazet@google.com, schung@nuvoton.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v8 2/3] arm64: dts: nuvoton: Add
	Ethernet nodes
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
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[lunn.ch:s=20171124];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lunn.ch : SPF not aligned (strict),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:a0987203069@gmail.com,m:ychuang3@nuvoton.com,m:edumazet@google.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:openbmc@lists.ozlabs.org,m:joabreu@synopsys.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nuvoton.com,google.com,st-md-mailman.stormreply.com,kernel.org,lists.ozlabs.org,synopsys.com,redhat.com,vger.kernel.org,gmail.com,st.com,lists.infradead.org,lunn.ch,davemloft.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: E34574CCB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgMDk6MzQ6MzlBTSArMDgwMCwgSm9leSBMdSB3cm90ZToK
PiBEZWFyIEFuZHJldywKClBsZWFzZSBkb24ndCB0b3AgcG9zdC4KCj4gCj4gVGhhbmtzIGZvciB0
aGUgY2xhcmlmaWNhdGlvbi4KPiAKPiBJbiBvdXIgZGVzaWduLCB0aGUgRXRoZXJuZXQgUEhZcyBh
cmUgbG9jYXRlZCBvbiB0aGUgYmFzZSBib2FyZHMsIG5vdCBvbiB0aGUKPiBNQTM1RDEgU09NLgo+
IAo+IFRoZSBTT00gYmFzZSBib2FyZCByb3V0ZXMgdHdvIFJHTUlJIGludGVyZmFjZXMgZnJvbSB0
aGUgU09NIHRvIHR3byBleHRlcm5hbAo+IFBIWXMgb24gdGhlIGNhcnJpZXIgYm9hcmQuCj4gCj4g
T24gdGhlIE1BMzVEMSBJb1QgYm9hcmQsIHRoZXJlIGlzIG5vIHNlcGFyYXRlIFNPTSBhbmQgY2Fy
cmllciBib2FyZCAtIGl0IGlzCj4gYSBzaW5nbGUgaW50ZWdyYXRlZCBib2FyZC4KPiAKPiBJIHdp
bGwgdXBkYXRlIHRoZSBEVFMgYWNjb3JkaW5nbHkgc28gdGhhdCBubyBQSFkgbm9kZXMgYXBwZWFy
IGluIC5kdHNpLgo+IAo+IFRoYW5rcyEKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gCj4gSm9leQo+IAo+
IEFuZHJldyBMdW5uIOaWvCAxLzE5LzIwMjYgMTE6MjIgUE0g5a+r6YGTOgo+ID4gT24gTW9uLCBK
YW4gMTksIDIwMjYgYXQgMDM6MzM6NDBQTSArMDgwMCwgSm9leSBMdSB3cm90ZToKPiA+ID4gQWRk
IEdNQUMgbm9kZXMgZm9yIG91ciBNQTM1RDEgZGV2ZWxvcG1lbnQgYm9hcmRzOgo+ID4gPiB0d28g
UkdNSUkgaW50ZXJmYWNlcyBmb3IgU09NIGJvYXJkLCBhbmQgb25lIFJHTUlJCj4gPiA+IGFuZCBv
bmUgUk1JSSBpbnRlcmZhY2UgZm9yIElvVCBib2FyZC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEpvZXkgTHUgPGEwOTg3MjAzMDY5QGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAgLi4u
L2Jvb3QvZHRzL251dm90b24vbWEzNWQxLWlvdC01MTJtLmR0cyAgICAgIHwgMTIgKysrKysKPiA+
ID4gICAuLi4vYm9vdC9kdHMvbnV2b3Rvbi9tYTM1ZDEtc29tLTI1Nm0uZHRzICAgICAgfCAxMCAr
KysrCj4gPiA+ICAgYXJjaC9hcm02NC9ib290L2R0cy9udXZvdG9uL21hMzVkMS5kdHNpICAgICAg
IHwgNTQgKysrKysrKysrKysrKysrKysrKwoKRG9lcyBtYTM1ZDEuZHRzaSByZXByZXNlbnQgdGhl
IFNPTT8KCklmIHNvLCB3aGF0IGlzIG1hMzVkMS1zb20tMjU2bS5kdHMgPyBJdCBsb29rcyBsaWtl
IHNvbWUgb2RkIHNvcnQgb2YKY2FycmllciBib2FyZCB3aXRoIGEgZmV3IHNlcmlhbCBwb3J0cyBh
bmQgc29tZSBtZW1vcnk/IEJ1dCBzeXN0ZW1zCmxpa2UgdGhpcyBwdXQgdGhlIG1lbW9yeSBvbiB0
aGUgU09NLCBub3QgdGhlIGNhcnJpZXIuCgpBcyBpIHNhaWQsIGknbSBjb25mdXNlZCB3aXRoIHlv
dXIgbmFtaW5nIGhlcmUuCgogICBBbmRyZXcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
