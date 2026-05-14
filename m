Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL6FMwX1BWpVdwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 18:15:01 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C7554485F
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 18:15:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50D24C8F263;
	Thu, 14 May 2026 16:15:00 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 677D1C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 16:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=/0vlkD0eChacF5ETVs9gmQqQ0rk59QxBVpBmKOtfWuM=; b=MH
 b8489xnA2ZxWUKc2vcNPg4J9fYfFtGzkdsdG0R2HUXd3IdFjthQWSwF9nbq0QRP0ufXfJArwfA0nB
 B3GM5alMzhJoYuJLsJqMjxhoA+Fl1XFy0QStBr/zLnR/6LqkhTy5nd/UWuARxD6XpBBnKlm05OKqh
 mMq21XRqy3xEaP8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1wNYhL-002vrb-Oy; Thu, 14 May 2026 18:14:07 +0200
Date: Thu, 14 May 2026 18:14:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Thompson <daniel@riscstar.com>
Message-ID: <f113752b-b351-4a14-af6d-1e2751f0913d@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <01d6ea18-e022-41c7-a642-ac0321957923@oss.qualcomm.com>
 <agRzai1UoHEIotZe@aspen.lan>
 <3c6e7ec5-f600-44ee-a97a-211a99102744@lunn.ch>
 <agXo_evi1oFLBJoo@aspen.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <agXo_evi1oFLBJoo@aspen.lan>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 chenchuangyu@xiaomi.com, edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 Alex Elder <elder@riscstar.com>, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, maxime.chevallier@bootlin.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, konradybcio@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, hawk@kernel.org, arnd@arndb.de, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, linux-gpio@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, gregkh@linuxfoundation.org,
 andersson@kernel.org, a0987203069@gmail.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, linusw@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 12/12] arm64: dts: qcom:
 qcs6490-rb3gen2: enable TC9564 with a single QCS8081 phy
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
X-Rspamd-Queue-Id: 25C7554485F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[lunn.ch:s=20171124];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[lunn.ch : SPF not aligned (strict),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:daniel@riscstar.com,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:elder@riscstar.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:konrad.dybcio@oss.qualcomm.com,m:gregkh@linuxfoundation
 .org,m:andersson@kernel.org,m:a0987203069@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:linusw@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:-];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,riscstar.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	NEURAL_SPAM(0.00)[0.182];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,1c:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

TT4gSeKAmW0gYWZyYWlkIHRoaXMgbXVzdCBiZSBuZWNlc3NhcmlseSBsb25nIGJ1dCB0byBoZWxw
IG5hdmlnYXRlIHRoZQo+IGdlbmVyYWwgc3RydWN0dXJlIGlzOgoKVGhhbmtzIGZvciB0aGUgbG9u
ZyBlbWFpbC4KCj4gTGV04oCZcyB0dXJuIG91ciBhdHRlbnRpb24gdG8gTURJTy4KPiAKPiBGb2xs
b3dpbmcgdGhlIHBhdHRlcm4gYWJvdmUgd2hlcmUgYWxsIHRoZSBsaW5rcyByZWxhdGVkIHRvIHBv
d2VyIGNvbWUKPiBmcm9tIHRoZSBtYWluIGRldmljZSBub2RlLCB0aGVuIHRoZSBwaHkgbm9kZSBm
b3IgdGhlIHFjYTgwODEgaW4gYW4KPiByYjNnZW4yIHdvdWxkIGxvb2sgbGlrZSBzb21ldGhpbmcg
bGlrZSB0aGlzOgo+IAo+ICAgICB0Yzk1NnhfZW1hYzFfcGh5OiBldGhlcm5ldC1waHlAMWMgewo+
ICAgICAgICAgY29tcGF0aWJsZSA9ICJldGhlcm5ldC1waHktaWQwMDRkLmQxMDEiOwo+ICAgICAg
ICAgcmVnID0gPDB4MWM+Owo+IAo+ICAgICAgICAgcmVzZXQtZ3Bpb3MgPSA8JnRjOTU2eF9lbWFj
MCAxIEdQSU9fQUNUSVZFX0xPVz47Cj4gICAgICAgICAjIE9uIFJCM2dlbjIgYWxsIHN1cHBsaWVz
IGFyZSBjb250cm9sbGVkIGJ5IGEgc2luZ2xlIEdQSU8KPiAgICAgICAgICMgc28gd2UgbGluayBh
bGwgc3VwcGxpZXMgdG8gdGhhdCBzaW5nbGUgcmVndWxhdG9yCj4gICAgICAgICBhdmRkLXN1cHBs
eSA9IDwmcWVwXzFwOD47Cj4gICAgICAgICBhdmRkMTgtc3VwcGx5ID0gPCZxZXBfMXA4PjsKPiAg
ICAgICAgIHZkZC1zdXBwbHkgPSA8JnFlcF8xcDg+Owo+ICAgICAgICAgdmRkbGRvLXN1cHBseSA9
IDwmcWVwXzFwOD47Cj4gICAgICAgICB2ZGQxOC1zdXBwbHkgPSA8JnFlcF8xcDg+Owo+ICAgICAg
ICAgdmRkMTI1LXN1cHBseSA9IDwmcWVwXzFwOD47Cj4gCj4gICAgICAgICBwaW5jdHJsLW5hbWVz
ID0gImRlZmF1bHQiOwo+ICAgICAgICAgcGluY3RybC0wID0gPCZxZXBfaXJxX3Bpbj47Cj4gICAg
ICAgICBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZ0bG1tIDEwMSBJUlFfVFlQRV9MRVZFTF9MT1c+
Owo+ICAgICB9Owo+IAo+IE9uY2Ugd2UgaGF2ZSBlc3RhYmxpc2hlZCB3aGF0IHRoZSBEVCBsb29r
cyBsaWtlIHRoZW4gdGhlIHF1ZXN0aW9uCj4gYmVjb21lcyB3aGVyZSB0byBwdXQgInNvbWV0aGlu
Zywgd3JpdHRlbiBpbiBDIFtvciBSdXN0XSwgdGhhdCBjb250YWlucwo+IGJ1cm5lZCBpbiBrbm93
bGVkZ2Ugb2YgaG93IHRvIHR1cm4gb24gYSB3Y242ODU1XkheSF5IXkheSF5IXkhxY2E4MDgxIj8K
PiAKPiBUaGUgcWNhODA4MSBvbiByYjNnZW4yIGp1c3QgZ2V0cyBhIGJ1bmNoIG9mIGluZGl2aWR1
YWwgcmVndWxhdG9ycyBhbmQgYQo+IHJlc2V0LiBBcyBpbiB0aGUgcGNpLXB3cmN0cmwtdGM5NTYz
IGV4YW1wbGUgYWJvdmUsIHRoaXMgbWVhbnMgdGhlcmUgaXMKPiBub3RoaW5nIGluIHRoZSBEVCBm
b3IgYSBwd3JzZXEgZHJpdmVyIHRvIGJpbmQgdG8uCgpJIGRvbid0IHVuZGVyc3RhbmQgdGhhdC4g
V2UgaGF2ZSBhIG5vZGUgaW4gZGV2aWNlIHRyZWUgZm9yIHRoZSBQSFkuIFdlCmNhbiBwdXQgdGhl
IG5lZWRlZCBwcm9wZXJ0aWVzIHRoZXJlIHNvbWVob3cuIE1heWJlIHNpbWlsYXIgdG8gaG93CnBp
bmN0cmwgd29ya3MuIEJlZm9yZSBwcm9iaW5nIHRoZSBkZXZpY2UsIHRoZSBkcml2ZXIgY29yZSBs
b29rcyBmb3IKdGhlIHBpbmN0cmwtIHByb3BlcnRpZXMsIGFuZCBhY3RpdmF0ZXMgdGhlbS4gV2Ug
Y291bGQgaGF2ZSBzaW1pbGFyCnByb3BlcnRpZXMgZm9yIHBvd2VyIHNlcXVlbmNpbmcsIGJlZm9y
ZSBlbnVtZXJhdGluZyBhbiBhZGRyZXNzLCBkbwp3aGF0ZXZlciB0aGUgcHdyc2VxLW5hbWVzIHJl
cXVlc3RzPyBJdCBtaWdodCBuZWVkIGhlbHAgZm9yIHRoZSBkcml2ZXIKYWN0dWFsbHkgZW51bWVy
YXRpbmcgdGhlIGJ1cywgdG8gcG9pbnQgdG8gY29yZSBhdCB0aGUgbm9kZS4KCj4gRXZlbiBpZiB3
ZSBjb3VsZCBmaW5kCj4gYSB3YXkgdG8gZG8gdGhhdCwgaXQgaXMgbm90IG9idmlvdXNseSB1c2Vm
dWwgdG8gZGVjb3VwbGUgaG93IHRvIHR1cm4gb24KPiBhbiBNRElPIGRldmljZSBmcm9tIGhvdyB0
byBkcml2ZSBpdC4gVGh1cyBJIHRoaW5rIHRoZSByaWdodCBhbnN3ZXIgdG8KPiB0aGF0IGlzIHRv
IHB1dCB0aGUgY29kZSB0byBmaXJlIHVwIHRoZSByZWd1bGF0b3JzIGludG8gdGhlIHFjYTgwOHgu
Ywo+IGRyaXZlciBhbmQgaXQgbG9va3MgdG8gbWUgbGlrZSB0aGUgZXhpc3RpbmcgcHJvYmUvcmVt
b3ZlIG1ldGhvZHMgd291bGQKPiBhbHJlYWR5IHdvcmsgcGVyZmVjdGx5IHdlbGwgYXMgdGhlIHBs
YWNlIHRvIHB1dCBpdC4KCkJ1dCB5b3UgaGF2ZSBhIGNoaWNrZW4vZWdnLiBTYW1lIGFzIHdpdGgg
UENJLCB3aXRoIEV0aGVybmV0IFBIWXMsIHlvdQphc2sgdGhlIGRldmljZSB3aGF0IGl0IGlzLCBh
bmQgdGhlbiBmaW5kIGEgZHJpdmVyIHRvIGRyaXZlIGl0LCBhbmQKdGhlbiBjYWxsIHRoZSBwcm9i
ZSBmdW5jdGlvbi4gSG93ZXZlciwgaWYgaXRzIGNsb2NrIGlzIG9mZiwgaXRzIEdQSU8KcmVzZXQg
aXMgaGVsZCBpbiByZXNldCwgaXRzIHBvd2VyIHJlZ3VsYXRvcnMgYXJlIHN3aXRjaCBvZmYsIGl0
IG5ldmVyCmFuc3dlcnMgd2hlbiB5b3UgYXNrIGl0LCB3aGF0IGFyZSB5b3U/IElmIHlvdSBoYXZl
IG5vIGlkZWEgd2hhdCBpdCBpcywKeW91IGNhbm5vdCBwcm9iZSBpdC4gQW5kIGlmIHlvdSBjYW5u
b3QgcHJvYmUgaXQsIHRoZSBwcm9iZSBmdW5jdGlvbgpjYW5ub3QgdHVybiBhbGwgdGhlc2UgdGhp
bmdzIG9uLgoKVGhlIHN0YW5kYXJkIHJlcGx5IHdlIGhhdmUgaXMsIGlnbm9yZSB0aGUgZmFjdCB0
aGUgZGV2aWNlIGNhbiBiZQplbnVtZXJhdGVkLCBoYXJkIGNvZGUgaW4gRFQgd2hhdCBpdHMgSUQg
aXMuIEFuZCB0aGF0IGlzIHdoYXQgeW91IGhhdmUKYWJvdmUgaW4geW91ciBEVCBmcmFnbWVudC4g
QnV0IHlvdSBhbHNvIG5lZWQgdG8gbGl2ZSB3aXRoIHRoZQpjb25zZXF1ZW5jZXMgb2YgaXQgYmVp
bmcgd3JvbmcsIHNpbmNlIHRoYXQgZHJpdmVyIGlzIGdvaW5nIHRvIGJlCmxvYWRlZCwgbm8gcXVl
c3Rpb25zIGFza2VkLiBBbmQgZG9uJ3QgdGhpbmsgYWJvdXQgaGF2aW5nIGEgcmV2IEEgYm9hcmQK
YW5kIGEgcmV2IEIgYm9hcmQgd2hpY2ggaGF2ZSBkaWZmZXJlbnQgcGluIGNvbXBhdGlibGUgUEhZ
cywgYW5kIHdhbnQKdG8gdXNlIHRoZSBlbnVtZXJhdGlvbiB0byBnZXQgdGhlIGNvcnJlY3QgZHJp
dmVyIGxvYWRlZC4KCkRUIGRldmVsb3BlcnMgY29udGludWFsbHkgd2FudCB0byBtYWtlIHVzZSBv
ZiB0aGUgZW51bWVyYXRpb24gZmVhdHVyZSwKc2luY2UgaXQgaXMgdGhlcmUsIHBhcnQgb2YgODAy
LjMsIGl0IGlzIGhvdyBpdCB3YXMgZG9uZSBmb3IgdGhlIGZpcnN0CjIwIHllYXJzIG9mIG5ldHdv
cmtpbmcsIGV0Yy4gQW5kIHRoZXkga2VlcCB0cnlpbmcgdG8gZXh0ZW5kIHRoZQpjdXJyZW50IGNv
ZGUgdG8gZ2V0IHRoZSBQSFkgcnVubmluZyB0byBhbGxvdyBpdCB0byBiZSBlbnVtZXJhdGVkLiAg
QW5kCmkga2VlcCByZWplY3RpbmcgaXQuCgpJZGVhbGx5LCBpIHdvdWxkIGxpa2Ugc29tZSBnZW5l
cmljIGNvcmUgY29kZSB3aGljaCBjYW4gYmUgZ2l2ZW4gYSBsaXN0Cm9mIHJlc291cmNlcywgcHJv
YmFibHkgcGhhbmRsZXMsIGFuZCB0aW1pbmcgaW5mb3JtYXRpb24uIEFuZCBpdCB3aWxsCndhbGsg
dGhlIGxpc3QgYW5kIHR1cm4gdGhlbSBvbiwgaW5zZXJ0aW5nIHRoZSByZXF1ZXN0ZWQgZGVsYXlz
LiBBbmQKdGhlbiB3ZSBjYW4gZW51bWVyYXRlIHRoZSBkZXZpY2UuCgpVbnRpbCBzdWNoIGNvZGUg
ZXhpc3RzLCBpIGFncmVlLCBmb3JnZXQgdGhlIGRldmljZSBpcyBlbnVtZXJhYmxlLCBoYXJkCmNv
ZGUgdGhlIElELCBhbmQgZ2V0IHRoZSBwcm9iZSBmdW5jdGlvbiB0byBlbmFibGUgdGhlIHJlZ3Vs
YXRvcnMsIHRha2UKdGhlIGRldmljZSBvdXQgb2YgcmVzZXQsIGVuYWJsZSB0aGUgY2xvY2tzLCBl
dGMuIEFuZCByZXBlYXQgdGhhdCBpbgpldmVyeSBQSFkgZHJpdmVyLgoKICAgICAgIEFuZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
