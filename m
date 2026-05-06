Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHsoKgR++2mEbwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 19:44:36 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF5F4DEF54
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 19:44:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5A5DC8F289;
	Wed,  6 May 2026 17:44:35 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80E39C8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 17:44:34 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-8d65f4073bfso900892885a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 May 2026 10:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778089473; x=1778694273;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k6wXO6STmxH+YsbEuPXhWzzsM6OvvesRxD9MxXwGEOY=;
 b=UeP+JWBT/ux9ZnLqRTE9W8rkS8hawJxGXcByc2mlWG5iM7hAlm3vSb0D3r1BGP4etJ
 g2jeW8MdRL+yJCjQU/uf+iDoAF8tvXsfbay1THAogVYALewB887wFJtIePtJHONe4FMC
 KbiHrwvvgLPW2cuy0JwXif1zVM3d73orC4Pgq5t8TOQ6Oc46yRbSVRTxmy50FO4EbHDC
 8qLS7QWUdZs2X0DTvT6dQy+8bGu4CS5AJqRD6fYw5E6WIxtZuC+/8YmFgbyAlttYTmIH
 jUBoQB7Yu7HkknUNi16/Yw7fPNjvulI/6zjYANDF1iOTN/j+CIIk9L7ZCOjrUovi3FPd
 mUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778089473; x=1778694273;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k6wXO6STmxH+YsbEuPXhWzzsM6OvvesRxD9MxXwGEOY=;
 b=SBsDlJKtw6FVqymQLBTvI2Am87rVl8HpgoBoY7EuqyaGHznng8f20XWFb3Isb4CJHJ
 7J5qBARwsZwR345Zwdqa+EceCgBOYvdm0VYEF1/PyWEk7sQduUxURwA1RSppao7RXTUM
 hothMZ554NsTOHMPmAaTJmXbKe9hZvZp1ASB6o85RLxIZAqM7iH8gcZUMW3txFspX3pS
 FT9pkgB/Dup4tYWqEfPUXW9BzsHK38NgpefYwdyEsbiXzbXcIVZdNSpeLJn/38MOsJ8r
 dfKX16yDFNhyxkBxaP37RDxtfK2KzYaxy0BTn/ijHXMU9/nF2KGYfdQe+u+j7S2zRTDB
 zHbA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8psSjTPf61F4tP0kzx5r6XvSidtsyhWcmz/b8KgEKabF8/+Sotn05YyOuIowU4+47FjcsrDwvL9KR+Eg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwUr3Ic6KjPqE2yR/w8tgda1zCdrMTI1C2AxAXf2pqwfe4RnFX2
 6osa18kLrb826bXoHnGxyiyO7up/lB403CoVKsNyZhQ7jtRxIQsKUOx3qoi98wK4sMo=
X-Gm-Gg: AeBDievhp2E9hjpBuW6eql87fKTu8F4uqrAY06NLpjVikp/FDgMBgo8Y9AjiSCagse7
 eDHAFPKV6X36GwEtuSVBgzlxEoKxmiVJ8H7PcRRzj+owxSunURZaL3165GFnSr3hxKsfeS5xWk3
 VpS0TLru/Wgv5P3VcRAiUE9sOSAnZqohTiJ55oMrQPoJWSrAj6CdMRbChY8YRNxbcQ9+XmUdnca
 2UE/OFzPd2NerLC5V6DusZ1av6zNE1XbP6UUawrR38D/3qmtWDfv2yEjjg1RjzVsI53Q7nOHWA3
 +5cSXZgRQKYhkV32Y1rgFE+aNWmzqKShAEuGIJumtaZ57BgI2iO77gy36JZHdLOLynYe7NYBp7a
 uctD+S3dRx1PoE8Q1HOCpfwTj1dWBcWJn50bTkP330AihFpC09yCynyr1gmGDLrHN5J/DBpp9Ga
 zPp92J1CKq6GEtmvF32ixlcCWpJimB0r1CraSLlCSxwvAqA2hf8d0HmJmOTPKwLczRprPNq8e/d
 A==
X-Received: by 2002:a05:620a:f0c:b0:8f1:9e59:220e with SMTP id
 af79cd13be357-904d63e7a90mr642596485a.39.1778089473124; 
 Wed, 06 May 2026 10:44:33 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8fc2c91cdfbsm1736572285a.34.2026.05.06.10.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 10:44:32 -0700 (PDT)
Message-ID: <7f3a0f16-5159-4bbc-8b15-9b5841603bf6@riscstar.com>
Date: Wed, 6 May 2026 12:44:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xilin Wu <sophon@radxa.com>, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, rmk+kernel@armlinux.org.uk,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <DD71CDEABC7C16D5+02d052ff-13bb-4712-a847-91416f76c578@radxa.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <DD71CDEABC7C16D5+02d052ff-13bb-4712-a847-91416f76c578@radxa.com>
Cc: me@ziyao.cc, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 devicetree@vger.kernel.org, hawk@kernel.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, livelycarpet87@gmail.com,
 ast@kernel.org, linux-gpio@vger.kernel.org, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, inochiama@gmail.com,
 a0987203069@gmail.com, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 10/12] net: stmmac: tc956x: add
 TC956x/QPS615 support
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
X-Rspamd-Queue-Id: 3FF5F4DEF54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:sophon@radxa.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m:linu
 x-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.844];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]

T24gNS81LzI2IDk6MzAgUE0sIFhpbGluIFd1IHdyb3RlOgo+IE9uIDUvMS8yMDI2IDExOjU0IFBN
LCBBbGV4IEVsZGVyIHdyb3RlOgo+PiBGcm9tOiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbEByaXNj
c3Rhci5jb20+Cj4+Cj4+IFRvc2hpYmEgVEM5NTZ4IGlzIGFuIEV0aGVybmV0IEFWQi9UU04gYnJp
ZGdlIGFuZCBpcyBlc3NlbnRpYWxseSBhCj4+IHNtYWxsIGFuZCBoaWdobHktc3BlY2lhbGl6ZWQg
U29DLiBUQzk1NnggaW5jbHVkZXMgYW4gImVNQUMiIHN1YnN5c3RlbQo+PiB0aGF0IGNhbiBiZSBh
Y2Nlc3NlZCwgYWxvbmcgd2l0aCBzZXZlcmFsIG90aGVyIHBlcmlwaGVyYWxzLCB2aWEgdHdvCj4+
IFBDSWUgZW5kcG9pbnQgZnVuY3Rpb25zLiBUaGVyZSBpcyBhIG1haW4gZHJpdmVyIGZvciB0aGUg
ZW5kcG9pbnQgdGhhdAo+PiBkZWNvbXBvc2VzIHRoaW5ncyBhbmQgY3JlYXRlcyBhdXhpbGlhcnkg
YnVzIGRldmljZXMgdG8gbW9kZWwgdGhlIFNvQy4KPj4KPj4gVGhlIGVNQUMgY29uc2lzdHMgb2Yg
YSBEZXNpZ253YXJlIFhHTUFDLCBYUENTIGFuZCBQTUEuIEVhY2ggZU1BQyBpcwo+PiBzdXBwb3J0
ZWQgYnkgYW4gTVNJR0VOIHRoYXQgYnJpZGdlcyBUQzk1NnggbGV2ZWwgaW50ZXJydXB0cyB0byBQ
Q0llCj4+IE1TSXMuCj4+Cj4+IEFkZCBhIGRyaXZlciBmb3IgdGhlIGVNQUMvTVNJR0VOIGNvbWJp
bmF0aW9uLgo+Pgo+PiBDby1kZXZlbG9wZWQtYnk6IEFsZXggRWxkZXIgPGVsZGVyQHJpc2NzdGFy
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQWxleCBFbGRlciA8ZWxkZXJAcmlzY3N0YXIuY29tPgo+
PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbEByaXNjc3Rhci5jb20+Cj4+
IC0tLQo+PiDCoCBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmlnwqDC
oCB8wqAgMTMgKwo+PiDCoCBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9NYWtl
ZmlsZcKgIHzCoMKgIDIgKwo+PiDCoCAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMt
dGM5NTZ4LmPCoMKgwqAgfCA3OTEgKysrKysrKysrKysrKysrKysrCj4+IMKgIGluY2x1ZGUvc29j
L3Rvc2hpYmEvdGM5NTZ4LWR3bWFjLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA4NCArKwo+
PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDg5MCBpbnNlcnRpb25zKCspCj4+IMKgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy10Yzk1Nngu
Ywo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9zb2MvdG9zaGliYS90Yzk1NngtZHdt
YWMuaAo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvS2NvbmZpZyBiL2RyaXZlcnMvIAo+PiBuZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvS2Nv
bmZpZwo+PiBpbmRleCBlM2RkNWFkZGE1YWNhLi42NmJjZmFjY2JlMjFmIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmlnCj4+ICsrKyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL0tjb25maWcKPj4gQEAgLTQwNCw2ICs0
MDQsMTkgQEAgY29uZmlnIERXTUFDX01PVE9SQ09NTQo+PiDCoMKgwqDCoMKgwqDCoCBUaGlzIGVu
YWJsZXMgZ2x1ZSBkcml2ZXIgZm9yIE1vdG9yY29tbSBEV01BQy1iYXNlZCBQQ0kgRXRoZXJuZXQK
Pj4gwqDCoMKgwqDCoMKgwqAgY29udHJvbGxlcnMuIEN1cnJlbnRseSBvbmx5IFlUNjgwMSBpcyBz
dXBwb3J0ZWQuCj4+ICtjb25maWcgRFdNQUNfVEM5NTZYCj4+ICvCoMKgwqAgdHJpc3RhdGUgIlRv
c2hpYmEgVEM5NTZYIERXTUFDIHN1cHBvcnQiCj4+ICvCoMKgwqAgZGVwZW5kcyBvbiBQQ0kKPj4g
K8KgwqDCoCBkZXBlbmRzIG9uIENPTU1PTl9DTEsKPj4gK8KgwqDCoCBkZXBlbmRzIG9uIFRPU0hJ
QkFfVEM5NTZYX1BDSQo+PiArwqDCoMKgIGRlZmF1bHQgbSBpZiBUT1NISUJBX1RDOTU2WF9QQ0kK
PiAKPiBIaSBBbGV4LAo+IAo+IEkgdGhpbmsgR0VORVJJQ19JUlFfQ0hJUCBzaG91bGQgYmUgc2Vs
ZWN0ZWQgaGVyZS4KClllcyB0aGVyZSBhcmUgYSBudW1iZXIgb2YgdGhpbmdzIG1pc3NpbmcgaW4g
dGhlIEtjb25maWcgZGVmaW5pdGlvbnMKYW5kIEknbSB3b3JraW5nIHRocm91Z2ggdGhlbSB0aGlz
IHdlZWsuICBBbmQgeWVzLCBzaW5jZSB3ZSB1c2UKaXJxX2dlbmVyaWNfY2hpcF9vcHMgd2UgbXVz
dCBlbnN1cmUgQ09ORklHX0dFTkVSSUNfSVJRX0NISVAgaXMKZW5hYmxlZCBoZXJlLgoKPiBUaGFu
ayB5b3UgZm9yIHRoZSBkcml2ZXIuCgpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2sgKHRoaXMg
YW5kIG90aGVycyBJIHNlZSkuCgoJCQkJCS1BbGV4CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
