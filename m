Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WK7cNZ+a/Gk6RwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 15:58:55 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6995C4E9B99
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 15:58:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFBEBC8F289;
	Thu,  7 May 2026 13:58:54 +0000 (UTC)
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEC67C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 13:58:52 +0000 (UTC)
X-QQ-mid: esmtpgz13t1778162251tb46c22e2
X-QQ-Originating-IP: p1YkURIHeJrROEemiAkk20u/XtKBsAHtUI9xGIh+rLI=
Received: from [127.0.0.1] ( [116.234.74.217]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 07 May 2026 21:57:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16399775298209443856
Message-ID: <3A5C0389E7C0D241+21a4f16b-1af8-46ac-8831-0c1b49694df0@radxa.com>
Date: Thu, 7 May 2026 21:57:26 +0800
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
 <DD71CDEABC7C16D5+02d052ff-13bb-4712-a847-91416f76c578@radxa.com>
 <7f3a0f16-5159-4bbc-8b15-9b5841603bf6@riscstar.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <7f3a0f16-5159-4bbc-8b15-9b5841603bf6@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NQRqsBxyhTK8H4y3/GYU3e8kZYDYhGXjOaXIsS5d/++MAHXHw80QgXET
 KiW8gv8I0SefpA4lvPHF5dzNAHqwcEXREoHnWtTEz2xx6dZIaF+GXg+dfzQU6JhNeZXftUj
 veisPMmQVeYp2Zsp6N/c4NT38ziSIFicrm8DouWNc8tKQyISRNgZKb3c4BA/YXQy27aWi6X
 +zGeExUJ5oXGGYSxY5k4MsFN7JrQIchSC9tOt6Sq7Nob0R+1+wyGOAeH2bW/LNhXiZ8nvm6
 eUFzvdXraV2lF0DLBmn1R8vzCO08IpAN2M0FFuYd9k/0Qn8nua1N2HW62n8Aa13LZnbZJpg
 oy4Jrh4pmZn18DwDKJ4FiI+4AS3C7rNYffxQ5aeJWQMczleuFzcpQ+5xaSDNLCO/+MKH3oU
 t+Aea47nadUcpmkElUvnP/lv/GjRp8CofDrwezk68hKZ8SzLnAlYi8OZCbYhCxwLAg+friB
 8J5Msqr+JlizL5w/KW+qagC5mAG/7blvO3zYON027LxAEXuIBOxAQoSzHBTtZP+5yCX8FhY
 J9Av/iSNkOHAdwSlcCasAlO3qvhLUH54Iym8n7AOKCSyk50CIZlyx8dCeXtvMXLtgnuUe1D
 Gf7yi7SO9tShICuMeV4RMC3L4c0n7jEIMGDo6ViaQ8QQStzfZOaro2WV1acfhfQcqSiSOkb
 Beuv8L6kk8w2Q+j6sJSo5+OHHNTV4g4mI+Rc3Cz/k1DGb5APsxqVu41SAorZpoXAgBCFKMA
 c6KcIgMuNvXOIu5G0up712tLixzxSDLL6AR6xG099+qCQweQ9OvbiUIW83vJBWwedjzrX72
 4T7yROvGiGcUd702ul4QnTdb3FnDRSmnqf++d2xiTbaCdQAVKH8eaHDUbZCkCFqs1Kp/KHU
 4IJUb3c+stn5hj+eCoKoz9EVSsaEuGFOgtV+r03VDaXAPZjOpGqzCDRAw8joRv1horS82r7
 GZ0f8nszt8PSbEM815SEr3kKHRMxLaJQHd3c90dMOjQ7c4pB5YlQXlORapBvz4TB2VC6LYU
 KI/CJKOG08XYPtgYUS
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
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
X-Rspamd-Queue-Id: 6995C4E9B99
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
	NEURAL_HAM(-0.00)[-0.952];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,radxa.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

T24gNS83LzIwMjYgMTo0NCBBTSwgQWxleCBFbGRlciB3cm90ZToKPiBPbiA1LzUvMjYgOTozMCBQ
TSwgWGlsaW4gV3Ugd3JvdGU6Cj4+IE9uIDUvMS8yMDI2IDExOjU0IFBNLCBBbGV4IEVsZGVyIHdy
b3RlOgo+Pj4gRnJvbTogRGFuaWVsIFRob21wc29uIDxkYW5pZWxAcmlzY3N0YXIuY29tPgo+Pj4K
Pj4+IFRvc2hpYmEgVEM5NTZ4IGlzIGFuIEV0aGVybmV0IEFWQi9UU04gYnJpZGdlIGFuZCBpcyBl
c3NlbnRpYWxseSBhCj4+PiBzbWFsbCBhbmQgaGlnaGx5LXNwZWNpYWxpemVkIFNvQy4gVEM5NTZ4
IGluY2x1ZGVzIGFuICJlTUFDIiBzdWJzeXN0ZW0KPj4+IHRoYXQgY2FuIGJlIGFjY2Vzc2VkLCBh
bG9uZyB3aXRoIHNldmVyYWwgb3RoZXIgcGVyaXBoZXJhbHMsIHZpYSB0d28KPj4+IFBDSWUgZW5k
cG9pbnQgZnVuY3Rpb25zLiBUaGVyZSBpcyBhIG1haW4gZHJpdmVyIGZvciB0aGUgZW5kcG9pbnQg
dGhhdAo+Pj4gZGVjb21wb3NlcyB0aGluZ3MgYW5kIGNyZWF0ZXMgYXV4aWxpYXJ5IGJ1cyBkZXZp
Y2VzIHRvIG1vZGVsIHRoZSBTb0MuCj4+Pgo+Pj4gVGhlIGVNQUMgY29uc2lzdHMgb2YgYSBEZXNp
Z253YXJlIFhHTUFDLCBYUENTIGFuZCBQTUEuIEVhY2ggZU1BQyBpcwo+Pj4gc3VwcG9ydGVkIGJ5
IGFuIE1TSUdFTiB0aGF0IGJyaWRnZXMgVEM5NTZ4IGxldmVsIGludGVycnVwdHMgdG8gUENJZQo+
Pj4gTVNJcy4KPj4+Cj4+PiBBZGQgYSBkcml2ZXIgZm9yIHRoZSBlTUFDL01TSUdFTiBjb21iaW5h
dGlvbi4KPj4+Cj4+PiBDby1kZXZlbG9wZWQtYnk6IEFsZXggRWxkZXIgPGVsZGVyQHJpc2NzdGFy
LmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggRWxkZXIgPGVsZGVyQHJpc2NzdGFyLmNvbT4K
Pj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsQHJpc2NzdGFyLmNvbT4K
Pj4+IC0tLQo+Pj4gwqAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvS2NvbmZp
Z8KgwqAgfMKgIDEzICsKPj4+IMKgIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L01ha2VmaWxlwqAgfMKgwqAgMiArCj4+PiDCoCAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
ZHdtYWMtdGM5NTZ4LmPCoMKgwqAgfCA3OTEgKysrKysrKysrKysrKysrKysrCj4+PiDCoCBpbmNs
dWRlL3NvYy90b3NoaWJhL3RjOTU2eC1kd21hYy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
ODQgKysKPj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgODkwIGluc2VydGlvbnMoKykKPj4+IMKgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21h
Yy10Yzk1NnguYwo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc29jL3Rvc2hpYmEv
dGM5NTZ4LWR3bWFjLmgKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvS2NvbmZpZyBiL2RyaXZlcnMvIAo+Pj4gbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL0tjb25maWcKPj4+IGluZGV4IGUzZGQ1YWRkYTVhY2EuLjY2YmNmYWNjYmUyMWYg
MTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9LY29u
ZmlnCj4+PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmln
Cj4+PiBAQCAtNDA0LDYgKzQwNCwxOSBAQCBjb25maWcgRFdNQUNfTU9UT1JDT01NCj4+PiDCoMKg
wqDCoMKgwqDCoCBUaGlzIGVuYWJsZXMgZ2x1ZSBkcml2ZXIgZm9yIE1vdG9yY29tbSBEV01BQy1i
YXNlZCBQQ0kgRXRoZXJuZXQKPj4+IMKgwqDCoMKgwqDCoMKgIGNvbnRyb2xsZXJzLiBDdXJyZW50
bHkgb25seSBZVDY4MDEgaXMgc3VwcG9ydGVkLgo+Pj4gK2NvbmZpZyBEV01BQ19UQzk1NlgKPj4+
ICvCoMKgwqAgdHJpc3RhdGUgIlRvc2hpYmEgVEM5NTZYIERXTUFDIHN1cHBvcnQiCj4+PiArwqDC
oMKgIGRlcGVuZHMgb24gUENJCj4+PiArwqDCoMKgIGRlcGVuZHMgb24gQ09NTU9OX0NMSwo+Pj4g
K8KgwqDCoCBkZXBlbmRzIG9uIFRPU0hJQkFfVEM5NTZYX1BDSQo+Pj4gK8KgwqDCoCBkZWZhdWx0
IG0gaWYgVE9TSElCQV9UQzk1NlhfUENJCj4+Cj4+IEhpIEFsZXgsCj4+Cj4+IEkgdGhpbmsgR0VO
RVJJQ19JUlFfQ0hJUCBzaG91bGQgYmUgc2VsZWN0ZWQgaGVyZS4KPiAKPiBZZXMgdGhlcmUgYXJl
IGEgbnVtYmVyIG9mIHRoaW5ncyBtaXNzaW5nIGluIHRoZSBLY29uZmlnIGRlZmluaXRpb25zCj4g
YW5kIEknbSB3b3JraW5nIHRocm91Z2ggdGhlbSB0aGlzIHdlZWsuwqAgQW5kIHllcywgc2luY2Ug
d2UgdXNlCj4gaXJxX2dlbmVyaWNfY2hpcF9vcHMgd2UgbXVzdCBlbnN1cmUgQ09ORklHX0dFTkVS
SUNfSVJRX0NISVAgaXMKPiBlbmFibGVkIGhlcmUuCj4gCj4+IFRoYW5rIHlvdSBmb3IgdGhlIGRy
aXZlci4KPiAKPiBUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2sgKHRoaXMgYW5kIG90aGVycyBJ
IHNlZSkuCj4gCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC1BbGV4
Cj4gCj4gCj4gCgpIaSBBbGV4LAoKRG8geW91IHRoaW5rIGlmIGEgc2h1dGRvd24gY2FsbGJhY2sg
bGlrZSB0aGlzIGlzIHJlcXVpcmVkPyBJdCBsb29rcyBsaWtlIAp0aGUgZHJpdmVyIHNvbWV0aW1l
cyBkb2VzIGEgTURJTyBNTUlPIHJlYWQgd2hlbiB0aGUgUENJZSBsaW5rIGlzIGRvd24sIApjYXVz
aW5nIHRoZSBib2FyZCB0byByZXNldCBkdWUgdG8gU29DIHNpZGUgUENJZSBOb0MgdGltZW91dC4K
CkFmdGVyIHRoaXMgY2hhbmdlLCB0aGUgYm9hcmQgY2FuIGFsd2F5cyBzaHV0ZG93biBncmFjZWZ1
bGx5LgoKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9k
d21hYy10Yzk1NnguYyAKYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21h
Yy10Yzk1NnguYwppbmRleCA0ZThiNGExODU1ODMuLjM0YjhlM2ZlMWI1MSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtdGM5NTZ4LmMKKysrIGIv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtdGM5NTZ4LmMKQEAgLTc2
Nyw2ICs3NjcsMTcgQEAgc3RhdGljIHZvaWQgdGM5NTZ4X2R3bWFjX3JlbW92ZShzdHJ1Y3QgCmF1
eGlsaWFyeV9kZXZpY2UgKmFkZXYpCiAgICAgICAgIHRjOTU2eF9tYWNfZGlzYWJsZSh0ZCk7CiAg
fQoKK3N0YXRpYyB2b2lkIHRjOTU2eF9kd21hY19zaHV0ZG93bihzdHJ1Y3QgYXV4aWxpYXJ5X2Rl
dmljZSAqYWRldikKK3sKKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmYWRldi0+ZGV2Owor
ICAgICAgIGludCByZXQ7CisKKyAgICAgICByZXQgPSBzdG1tYWNfc3VzcGVuZChkZXYpOworICAg
ICAgIGlmIChyZXQpCisgICAgICAgICAgICAgICBkZXZfd2FybihkZXYsICJmYWlsZWQgdG8gc3Vz
cGVuZCBNQUMgZHVyaW5nIHNodXRkb3duOiAlZFxuIiwKKyAgICAgICAgICAgICAgICAgICAgICAg
IHJldCk7Cit9CisKICBzdGF0aWMgY29uc3Qgc3RydWN0IGF1eGlsaWFyeV9kZXZpY2VfaWQgdGM5
NTZ4X2R3bWFjX2lkc1tdID0gewogICAgICAgICB7IC5uYW1lID0gVEM5NTZYX1BDSUVfRFJJVkVS
X05BTUUgIi4iIFRDOTU2WF9YR01BQ19ERVZfTkFNRSwgfSwKICAgICAgICAgeyB9LApAQCAtNzc3
LDYgKzc4OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXV4aWxpYXJ5X2RyaXZlciB0Yzk1NnhfZHdtYWNf
ZHJpdmVyID0gewogICAgICAgICAubmFtZSAgICAgICAgICAgPSBEUklWRVJfTkFNRSwKICAgICAg
ICAgLnByb2JlICAgICAgICAgID0gdGM5NTZ4X2R3bWFjX3Byb2JlLAogICAgICAgICAucmVtb3Zl
ICAgICAgICAgPSB0Yzk1NnhfZHdtYWNfcmVtb3ZlLAorICAgICAgIC5zaHV0ZG93biAgICAgICA9
IHRjOTU2eF9kd21hY19zaHV0ZG93biwKICAgICAgICAgLmlkX3RhYmxlICAgICAgID0gdGM5NTZ4
X2R3bWFjX2lkcywKICAgICAgICAgLmRyaXZlciA9IHsKICAgICAgICAgICAgICAgICAubmFtZSAg
ID0gRFJJVkVSX05BTUUsCgotLSAKQmVzdCByZWdhcmRzLApYaWxpbiBXdSA8c29waG9uQHJhZHhh
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
