Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK1aC87g/Wn0jwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 15:10:38 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A384F6D05
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 15:10:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8D38C36B2A;
	Fri,  8 May 2026 13:10:36 +0000 (UTC)
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 936C5C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2026 13:10:35 +0000 (UTC)
X-QQ-mid: esmtpsz21t1778245760te8ff9860
X-QQ-Originating-IP: oDfTC3UmzXvWtX1d3MtBp/Xfjq9qMy3Zm4+IG/bmLQ4=
Received: from [127.0.0.1] ( [116.234.74.217]) by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 08 May 2026 21:09:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10512550886452153488
Message-ID: <6744F8FEFD290FFD+4973b8ba-7d3b-45e4-8478-0b3334b81960@radxa.com>
Date: Fri, 8 May 2026 21:09:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <224E233C593EF171+8c8a43dd-5061-40f8-9eb7-f360eabf2ecc@radxa.com>
 <ae90a4c9-f027-4373-a378-d0d4b7796ff3@riscstar.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <ae90a4c9-f027-4373-a378-d0d4b7796ff3@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OXhWvHhbOVwtNtdFner3XjoupFst+cPiDJj5eMgVxIqTEFWTRek3Mp/S
 56XANhJu36lge5/FagX1wODQlmUEGRgz6IS7M7nrgW1yS5+VZcsgG4W2IigNRc31EpSGai2
 5lhox7bCO4YpcKlS11wyIWrxBVTqQ2TNJiaCMAXjidsoKD7ZPDAJ1mz5wFFaeDJukE3iNFn
 RpbW6+dBs0MPa3wpToHk6VTuzznwvsm5czPiOit5zDjMuIflshW8kicGLycJbYylqbINUHz
 KmL7cu8iLMTg2hBPx1GR/7SrkE8ugPuTA2rR2FQMjHJI4H0CYSYD8ArrO5hmO1svfkIyia0
 9/hqd3L/rq047v4UbSYvlm0xIc0RPUsu2CFin1hc3lqYRAQOUQiP60zDFGX+wPxRZpDz9XL
 0IApj0AwwRr8JzRxUy0UXd0Nd/+TOWJ6qwdtbIr/ATvVvO2hPaYxV1hmJS3JPDxOoNRFA4P
 tQ+sk7YfJNaORMkf4qXP8D1NqScRxWiwd1rWPyR8jR3FUul/S8pqIaOSAN2KC7w1exVsPuf
 ysz//0JoFIyWdtqct+g7Z+S+8UaWc2BGhsVx8k10Ue/wvTpYhHYJNBOLM3Cc9/3NuqLfTsd
 cX00lNIEbyqfmLKE7qzlBGIyZfokeVpN410SNFuaXt30EOLskan7dBsFkCIbgoVUnh/3f+9
 rH+cmf01axxePgAFRJ3EmcoD2v7aH64QAlnWE74byh7J7aVengA/+5pSokPNSImPmMICDBO
 UIVy6bkKfRxrXT6NqMHkewzrncQDU8yub2WoUSyjEZdkyuDFQPh9/9JmoaIbeMvFStMWdYP
 nGmWWJR46h3zeHdntSmMq4eiUchlUI4AH96ebyvDJGNdgLyFeCl917IgbZLuZta5VRv587g
 aLoiMDdfcHmmMOdnWXz4pTmOZkZGpSCrqsmhSt7O4sdfa0NBxtwiZ5wENvLOP946xwAxp4A
 sRXvMrg2grZM+34gycys2Yta7xf+GtlRGjiDCxc77tPRhfEdU3UgJUvHWmZiz5ZwfHbujcQ
 25pJtrucvJjQh6xR2zcsEe3Axoa1viF7NWMEtYS5SDWJaD/ODq
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
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
X-Rspamd-Queue-Id: C2A384F6D05
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m:li
 nux-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_SENDER(0.00)[sophon@radxa.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.975];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,radxa.com:mid,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

T24gNS84LzIwMjYgMjo0NCBBTSwgQWxleCBFbGRlciB3cm90ZToKPiBPbiA1LzYvMjYgNzo1OSBB
TSwgWGlsaW4gV3Ugd3JvdGU6Cj4+IE9uIDUvMS8yMDI2IDExOjU0IFBNLCBBbGV4IEVsZGVyIHdy
b3RlOgo+Pj4gK8KgwqDCoCAvKiBBWEkgQ29uZmlndXJhdGlvbiAqLwo+Pj4gK8KgwqDCoCBheGkg
PSAmdGQtPmF4aTsKPj4+ICvCoMKgwqAgYXhpLT5heGlfbHBpX2VuID0gMTsKPj4+ICvCoMKgwqAg
YXhpLT5heGlfd3Jfb3NyX2xtdCA9IDMxOwo+Pj4gK8KgwqDCoCBheGktPmF4aV9yZF9vc3JfbG10
ID0gMzE7Cj4+PiArwqDCoMKgIC8qIEFsbCBzaXplcyAoMl4yLi4yXjgpIGFyZSBzdXBwb3J0ZWQg
Ki8KPj4+ICvCoMKgwqAgYXhpLT5heGlfYmxlbl9yZWd2YWwgPSBETUFfQVhJX0JMRU5fTUFTSzsK
Pj4+ICvCoMKgwqAgcGxhdC0+YXhpID0gYXhpOwo+Pj4gKwo+Pj4gK8KgwqDCoCBwbGF0LT5tYWNf
cG9ydF9zZWxfc3BlZWQgPSBzcGVlZDsKPj4+ICvCoMKgwqAgcGxhdC0+ZmxhZ3MgPSBTVE1NQUNf
RkxBR19NVUxUSV9NU0lfRU4gfCBTVE1NQUNfRkxBR19UU09fRU47Cj4+Cj4+IEkgZ290IFdvTCB3
b3JraW5nIG9ubHkgYWZ0ZXIgYWRkaW5nIFNUTU1BQ19GTEFHX1VTRV9QSFlfV09MIGhlcmUuIEkg
Cj4+IGd1ZXNzIGl0J3MgcmVxdWlyZWQsIHNpbmNlIHRoZSBkcml2ZXIgY2xvY2tzIGRvd24gdGhl
IE1BQy9QTUEvWFBDUyBpbiAKPj4gaXRzIHN1c3BlbmQgaG9vaz8KPiAKPiBJIGp1c3Qgd2FudCB0
byByZXNwb25kIHRvIHRoaXMgd2l0aCBhIHN1bW1hcnkgb2Ygb3VyIHBsYW5zLgo+IAo+IFdlIHdp
bGwgKm5vdCogYmUgaW1wbGVtZW50aW5nIHdha2Utb24tTEFOIChXb0wpIGluaXRpYWxseS7CoCBX
ZQo+IHdpbGwgd29yayB0byBnZXQgc3VwcG9ydCBmb3IgdGhlIGVNQUNzIHVwc3RyZWFtIGZvciBU
Qzk1NngsIGFuZAo+IHRoZW4gYXMgYSBzZXBhcmF0ZSBzdGVwLCB3ZSB3aWxsIGVuYWJsZSBXb0wu
Cj4gCj4gSXQncyBncmVhdCB0byBrbm93IHlvdSBoYXZlIGl0IHdvcmtpbmcsIGFuZCBvdXIgcGxh
biBpcyB0bwo+IGltcGxlbWVudCBpdCB2aWEgdGhlIFBIWXMgYW5kIG5vdCBpbnZvbHZlIHRoZSBN
QUMuwqAgSXQgc2VlbXMKPiBpdCB3aWxsIGJlIHJlbGF0aXZlbHkgZWFzeSwgYnV0IHdlIGhhdmUg
bm8gcGxhbnMgdG8gYWRkIGl0IHRvCj4gdGhlIGN1cnJlbnQgc2VyaWVzLgo+IAo+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtQWxleAo+IAoKSGkgQWxleCwKCk1heWJl
IEkgbWlzc2VkIHNvbWV0aGluZywgYnV0IEkgYWxyZWFkeSBoYXZlIFdvTCB3b3JraW5nICp3aXRo
b3V0KiAKY2hhbmdlcyBpbiB0aGUgdGM5NTZ4IGRyaXZlci4KCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC84NTk3NzZCNTY3MUIzNkI5KzU3N2MxOWU0LTNlNjYtNDAzNi1iMjZmLWZlMjAyODdh
MWQ0M0ByYWR4YS5jb20vCgoKLS0gCkJlc3QgcmVnYXJkcywKWGlsaW4gV3UgPHNvcGhvbkByYWR4
YS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
