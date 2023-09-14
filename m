Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C0F79FFA6
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 11:08:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A264C6B46F;
	Thu, 14 Sep 2023 09:08:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FDC4C6B462
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 09:08:43 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38E4F14n000879; Thu, 14 Sep 2023 11:08:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=19/t/7aa3tjI7A+p++1QXECy1ZjoXC8SO7oXAgid7Sc=; b=u3
 x4KHbO52/oq3U66cUFVWVm7f45NKHDyjrgZ5+mnwiFdJfanA+4PaQNLZ+wTP21Gg
 is6c/bjxfH9SAMkK3wcKg6VqMb7+nSEiTZs+lh2jBonWYcowJZX5vGS8t193KtKv
 fbSuBSARQ0/R5TEj7jMRNAHQpyhymD0BouS/4wZhWFNyUyiN93t+2f978bjybZam
 XfQ0PUYbZORaaSDQskqMHClEaM8jNbSgBxbI93Yn78jc2uYeBWOOSUQXRKh/yD66
 9vZPrZkHlaHhLFfhuhcPIR0IEbjgHJ/1GNGVYUKayrD2TSJcbG6fMr4izIyK553L
 rK3C4dM0ZYO146SjuDug==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t3tyw18gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Sep 2023 11:08:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D609E10005A;
 Thu, 14 Sep 2023 11:08:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE640227EFD;
 Thu, 14 Sep 2023 11:08:13 +0200 (CEST)
Received: from [10.201.20.125] (10.201.20.125) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 14 Sep
 2023 11:08:12 +0200
Message-ID: <ab2f88c3-2f80-a0ae-3a74-d90dd2a6ccf3@foss.st.com>
Date: Thu, 14 Sep 2023 11:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To: Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>
References: <20230901120836.1057900-1-yann.gautier@foss.st.com>
 <CACRpkdacRe5cPoSFJyEdo6nZrtmUHTNqMxf55CntvsdpFqhhrQ@mail.gmail.com>
 <CAPDyKFqJzoBiG4c2NbXA_6YDNsAh4W0TO-SP9+C2Qw40TKVH7g@mail.gmail.com>
Content-Language: en-US
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <CAPDyKFqJzoBiG4c2NbXA_6YDNsAh4W0TO-SP9+C2Qw40TKVH7g@mail.gmail.com>
X-Originating-IP: [10.201.20.125]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_07,2023-09-13_01,2023-05-22_02
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: stm32: add SDIO in-band
	interrupt mode
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

T24gOS80LzIzIDE0OjIxLCBVbGYgSGFuc3NvbiB3cm90ZToKPiBPbiBGcmksIDEgU2VwdCAyMDIz
IGF0IDE2OjEwLCBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3Rl
Ogo+Pgo+PiBIaSBZYW5uL0NocmlzdG9waGUsCj4+Cj4+IHRoYW5rcyBmb3IgeW91ciBwYXRjaCEK
Pj4KPj4gT24gRnJpLCBTZXAgMSwgMjAyMyBhdCAyOjA44oCvUE0gWWFubiBHYXV0aWVyIDx5YW5u
LmdhdXRpZXJAZm9zcy5zdC5jb20+IHdyb3RlOgo+Pgo+Pj4gRnJvbTogQ2hyaXN0b3BoZSBLZXJl
bGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4+Pgo+Pj4gQWRkIHRoZSBzdXBw
b3J0IG9mIFNESU8gaW4tYmFuZCBpbnRlcnJ1cHQgbW9kZSBmb3IgU1RNMzIgdmFyaWFudC4KPj4+
IEl0IGFsbG93cyB0aGUgU0QgSS9PIGNhcmQgdG8gaW50ZXJydXB0IHRoZSBob3N0IG9uIFNETU1D
X0QxIGRhdGEgbGluZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8g
PGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IFlhbm4g
R2F1dGllciA8eWFubi5nYXV0aWVyQGZvc3Muc3QuY29tPgo+PiAoLi4uKQo+Pj4gKysrIGIvZHJp
dmVycy9tbWMvaG9zdC9tbWNpLmgKPj4+IEBAIC0zMzIsNiArMzMyLDcgQEAgZW51bSBtbWNpX2J1
c3lfc3RhdGUgewo+Pj4gICAgKiBAb3BlbmRyYWluOiBiaXRtYXNrIGlkZW50aWZ5aW5nIHRoZSBP
UEVORFJBSU4gYml0IGluc2lkZSBNTUNJUE9XRVIgcmVnaXN0ZXIKPj4+ICAgICogQGRtYV9sbGk6
IHRydWUgaWYgdmFyaWFudCBoYXMgZG1hIGxpbmsgbGlzdCBmZWF0dXJlLgo+Pj4gICAgKiBAc3Rt
MzJfaWRtYWJzaXplX21hc2s6IHN0bTMyIHNkbW1jIGlkbWEgYnVmZmVyIHNpemUuCj4+PiArICog
QHVzZV9zZGlvX2lycTogYWxsb3cgU0QgSS9PIGNhcmQgdG8gaW50ZXJydXB0IHRoZSBob3N0Cj4+
Cj4+IFRoZSBkb2N1bWVudGF0aW9uIHRhZyBzaG91bGQgYmUgb25lIGxpbmUgdXAgKGNvbXBhcmUg
dG8gdGhlIG1lbWJlcnMuLi4pCj4+Cj4+PiBAQCAtMzc2LDYgKzM3Nyw3IEBAIHN0cnVjdCB2YXJp
YW50X2RhdGEgewo+Pj4gICAgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgc3RhcnRfZXJy
Owo+Pj4gICAgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgb3BlbmRyYWluOwo+Pj4gICAg
ICAgICAgdTggICAgICAgICAgICAgICAgICAgICAgZG1hX2xsaToxOwo+Pj4gKyAgICAgICB1OCAg
ICAgICAgICAgICAgICAgICAgICB1c2Vfc2Rpb19pcnE6MTsKPj4KPj4gMS4gYm9vbCB1c2Vfc2Rp
b19pcnE7Cj4+CkhpLAoKU2hvdWxkIGl0IHJlYWxseSBiZSBjaGFuZ2VkIHRvIGEgYm9vbD8KT3Ro
ZXIgYm9vbGVhbiBsaWtlcyBpbiB0aGUgc3RydWN0dXJlIGFyZSB1ODoxLgoKPj4gMi4gc3VwcG9y
dHNfc2Rpb19pcnEgaXMgbW9yZSB0byB0aGUgcG9pbnQgZG9uJ3QgeW91IHRoaW5rPwo+PiAgICAg
IEVzcGVjaWFsbHkgc2luY2UgaXQgYWN0aXZhdGVzIHRoZXNlIHR3byBjYWxsYmFja3M6Cj4+Cj4+
PiArICAgICAgIHZvaWQgKCplbmFibGVfc2Rpb19pcnEpKHN0cnVjdCBtbWNpX2hvc3QgKmhvc3Qs
IGludCBlbmFibGUpOwo+Pj4gKyAgICAgICB2b2lkICgqc2Rpb19pcnEpKHN0cnVjdCBtbWNpX2hv
c3QgKmhvc3QsIHUzMiBzdGF0dXMpOwo+Pgo+PiBGdXJ0aGVyOiBhbGwgdGhlIFV4NTAwIHZhcmlh
bnRzIHN1cHBvcnQgdGhpcyAoYml0IDIyKSBhcyB3ZWxsLCBzbyBlbmFibGUgdGhvc2UKPj4gdG9v
IGluIHRoZWlyIHZlbmRvciBkYXRhLiBBbGwgSSBoYXZlIGlzIG91dC1vZi1iYW5kIHNpZ25hbGlu
ZyB3aXRoIGFuIEdQSU8gSVJRCj4+IG9uIG15IEJyb2FkY29tIGNoaXBzIGJ1dCBJIHRoaW5rIGl0
IHdvcmtzIChtYXliZSBVbGYgaGFzIHRlc3RlZCBpdCBpbiB0aGUKPj4gZmFyIHBhc3QpLgo+IAo+
IEZvciB0aGUgdXg1MDAgdmFyaWFudCB0aGVyZSBpcyBhIEhXIHByb2JsZW0uIEFmdGVyIHJ1bm5p
bmcgc29tZSBzdHJlc3MKPiB0ZXN0cywgd2UgbWF5IGVuZCB1cCBiZWluZyBzdHVjayB3YWl0aW5n
IGZvciBhbiBTRElPIElSUSB0byBiZQo+IGRlbGl2ZXJlZC4gRXZlbiBpZiB0aGUgU0RJTyBpcnFz
IHNob3VsZCBiZSBjb25zaWRlcmVkIGxldmVsIHRyaWdnZXJlZCwKPiBpdCBsb29rZWQgbGlrZSBp
dCB3YXMgaW1wbGVtZW50ZWQgaW4gdGhlIEhXIGFzIGFuIGVkZ2UgdHJpZ2dlcmVkIElSUS4KPiAK
PiBUaGUgZG93bnN0cmVhbSB3b3JrYXJvdW5kIGNvbnNpc3RlZCBvZiByZS1yb3V0aW5nIHRoZSBE
QVQxIHRvIGEgR1BJTwo+IGF0IHJ1bnRpbWUgc3VzcGVuZCAod2Ugd2FudGVkIHRoYXQgZm9yIG9w
dGltYWwgcG93ZXIgc2F2ZSBzdXBwb3J0Cj4gYW55d2F5KSAtIGFuZCBtYW51YWxseSBjaGVja2lu
ZyBpZiB0aGUgREFUMSBsaW5lIHdhcyBhc3NlcnRlZCwgYmVmb3JlCj4gZW5hYmxpbmcgdGhlIEdQ
SU8gbGluZSBmb3IgYW4gaXJxLiBUaGlzIHdvcmtlZCBwZXJmZWN0bHkgZmluZSBhcyBhCj4gd29y
a2Fyb3VuZCwgd2l0aCB0aGUgbGltaXRhdGlvbiB0aGF0IG9uZSBtYXkgb2JzZXJ2ZSBhIGxpdHRs
ZSBiaXQgb2YKPiBoaWNrLXVwIGluIHRoZSB0cmFmZmljIG9jY2FzaW9uYWxseS4KPiAKPiBUaGF0
IHNhaWQsIHRoZSBvdXQtb2YtYmFuZCBJUlFzIGlzIHdoYXQgd29ya3MgYmVzdCBmb3IgdGhlIHV4
NTAwIHZhcmlhbnRzLgoKV2hhdCBJIHVuZGVyc3RhbmQgaGVyZSBpcyB0aGF0IGluLWJhbmQgaW50
ZXJydXB0cyBhcmUgbm90IHByb3Blcmx5IAp3b3JraW5nIG9uIHV4NTAwLCBhbmQgdGhlbiB0aGUg
ZmVhdHVyZSBzaG91bGRuJ3QgYmUgZW5hYmxlZCBmb3IgdGhpcyAKcGxhdGZvcm0uCkFtIEkgY29y
cmVjdD8KCklmIHRoaXMgaXMgdGhlIGNhc2UsIHRoZSB2MiB3aWxsIGNvbnNpc3QgaW4gY2hhbmdp
bmcgdGhlIHVzZV9zZGlvX2lycSB0byAKdXNlX3NkaW9faXJxLCBhbmQgdXBkYXRlIHRoZSBjb21t
ZW50IG9mIHRoZSBzdHJ1Y3QuCkFuZCBkZXBlbmRpbmcgb24gdGhlIGFuc3dlciwgbWF5YmUgY2hh
bmdlIHRoZSBmaWVsZCB0byBib29sLgoKQmVzdCByZWdhcmRzLApZYW5uCj4gCj4gS2luZCByZWdh
cmRzCj4gVWZmZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
