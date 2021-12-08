Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0E446D481
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Dec 2021 14:35:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43653C5F1E8;
	Wed,  8 Dec 2021 13:35:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F3B0C5F1E2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Dec 2021 13:35:11 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B8Cclne025876;
 Wed, 8 Dec 2021 14:34:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=b7J60CZ4uwTeJQ0u5OzpaoMz6M8+x9zjkJxexO30IRk=;
 b=aqZItg83GMtGbnmFwvW3j9qQlBHBWfz89uoHpa3RKpGiGAZxvkJqUgASz+ScwILbEC7f
 ntYoJu0dkoYnO5KHKjgpQsqp0NPg3p2PrhQs+R9zI+rYBZSIiF2KOFTs0M7n9jNgj8+O
 NmqXVZN3sOed36SWRtAnm/aIeclCteG93wkeG7ZAV/YOFqjJDv9LbZJ00firjJ3UNoMP
 +z3RzL7M6+9CwD7gU+INJNrUKNZYgSq5A9l5k9s6oojWTxMeKc5yai/g8dJp9YUcVLP0
 qy+wijSFYVhj544GiCPycClbS1Sjo8xo6TyMOfCUPjGE2LUPgY4AWRW6R/RgYHSEuvJZ 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ctrpq9x0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 14:34:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E5C4A10002A;
 Wed,  8 Dec 2021 14:34:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2C1B2107EE;
 Wed,  8 Dec 2021 14:34:49 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 8 Dec
 2021 14:34:48 +0100
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Ahmad
 Fatoum" <a.fatoum@pengutronix.de>
References: <20211125144053.774-1-olivier.moysan@foss.st.com>
 <20211125144053.774-2-olivier.moysan@foss.st.com>
 <1637875562.357461.2858318.nullmailer@robh.at.kernel.org>
 <237f56b3-0597-2526-a182-f1fbdd327338@foss.st.com>
 <Yaf4jiZIp8+ndaXs@robh.at.kernel.org>
 <627777a4-7458-88ed-e7c5-d11e3db847b5@foss.st.com>
 <cf5f994b-aecf-e051-f5c9-4a46e6414207@pengutronix.de>
 <cb7f19c0-3826-fcc8-227c-982838acf599@foss.st.com>
 <YbCgSeA1++U82jtn@google.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <fea38140-42be-ece3-b8ea-875ee63f8618@foss.st.com>
Date: Wed, 8 Dec 2021 14:34:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbCgSeA1++U82jtn@google.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_05,2021-12-08_01,2021-12-02_01
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alain.volmat@foss.st.com, arnaud.pouliquen@foss.st.com,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/4] ASoC: dt-bindings: stm32: i2s: add
 audio-graph-card port
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

T24gMTIvOC8yMSAxOjA4IFBNLCBMZWUgSm9uZXMgd3JvdGU6Cj4gT24gV2VkLCAwOCBEZWMgMjAy
MSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPiAKPj4gSGkgQWhtYWQKPj4KPj4gT24gMTIvNy8y
MSAyOjU5IFBNLCBBaG1hZCBGYXRvdW0gd3JvdGU6Cj4+PiBIZWxsbyBBbGV4LAo+Pj4KPj4+IE9u
IDA3LjEyLjIxIDE0OjUyLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+Pj4+IEhpIFJvYgo+Pj4+
Cj4+Pj4gT24gMTIvMS8yMSAxMTozNCBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+Pj4+IE9uIEZy
aSwgTm92IDI2LCAyMDIxIGF0IDExOjI1OjI3QU0gKzAxMDAsIE9saXZpZXIgTU9ZU0FOIHdyb3Rl
Ogo+Pj4+Pj4gSGkgUm9iLAo+Pj4+Pj4KPj4+Pj4+IE9uIDExLzI1LzIxIDEwOjI2IFBNLCBSb2Ig
SGVycmluZyB3cm90ZToKPj4+Pj4+PiBPbiBUaHUsIDI1IE5vdiAyMDIxIDE1OjQwOjUwICswMTAw
LCBPbGl2aWVyIE1veXNhbiB3cm90ZToKPj4+Pj4+Pj4gVGhlIFNUTTIgSTJTIERBSSBjYW4gYmUg
Y29ubmVjdGVkIHZpYSB0aGUgYXVkaW8tZ3JhcGgtY2FyZC4KPj4+Pj4+Pj4gQWRkIHBvcnQgZW50
cnkgaW50byB0aGUgYmluZGluZ3MuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE9s
aXZpZXIgTW95c2FuIDxvbGl2aWVyLm1veXNhbkBmb3NzLnN0LmNvbT4KPj4+Pj4+Pj4gLS0tCj4+
Pj4+Pj4+ICAgwqDCoCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvc3Qs
c3RtMzItaTJzLnlhbWwgfCA1ICsrKysrCj4+Pj4+Pj4+ICAgwqDCoCAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspCj4+Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+PiBSdW5uaW5nICdtYWtlIGR0
YnNfY2hlY2snIHdpdGggdGhlIHNjaGVtYSBpbiB0aGlzIHBhdGNoIGdpdmVzIHRoZQo+Pj4+Pj4+
IGZvbGxvd2luZyB3YXJuaW5ncy4gQ29uc2lkZXIgaWYgdGhleSBhcmUgZXhwZWN0ZWQgb3IgdGhl
IHNjaGVtYSBpcwo+Pj4+Pj4+IGluY29ycmVjdC4gVGhlc2UgbWF5IG5vdCBiZSBuZXcgd2Fybmlu
Z3MuCj4+Pj4+Pj4KPj4+Pj4+PiBOb3RlIHRoYXQgaXQgaXMgbm90IHlldCBhIHJlcXVpcmVtZW50
IHRvIGhhdmUgMCB3YXJuaW5ncyBmb3IgZHRic19jaGVjay4KPj4+Pj4+PiBUaGlzIHdpbGwgY2hh
bmdlIGluIHRoZSBmdXR1cmUuCj4+Pj4+Pj4KPj4+Pj4+PiBGdWxsIGxvZyBpcyBhdmFpbGFibGUg
aGVyZTogaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xNTU5NzUwCj4+Pj4+Pj4K
Pj4+Pj4+Pgo+Pj4+Pj4+IGF1ZGlvLWNvbnRyb2xsZXJANDAwMGIwMDA6ICdwb3J0JyBkb2VzIG5v
dCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdecG9ydEBbMC05XScsICdwaW5jdHJsLVswLTld
KycKPj4+Pj4+PiAgIMKgwqDCoMKgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2EtZGsxLmR0
LnlhbWwKPj4+Pj4+PiAgIMKgwqDCoMKgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZGsy
LmR0LnlhbWwKPj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFRoaXMgd2FybmluZyBpcyBub3QgYSBuZXcg
b25lLgo+Pj4+Pj4KPj4+Pj4+IFRoZSBpMnMyIG5vZGUgaW4gc3RtMzJtcDE1eHgtZGt4LmR0c2kg
d291bGQgcmVxdWlyZSB0aGUgZm9sbG93aW5nIGJpbmRpbmc6Cj4+Pj4+PiBwb3J0Ogo+Pj4+Pj4g
ICDCoMKgwqDCoCRyZWY6IGF1ZGlvLWdyYXBoLXBvcnQueWFtbCMKPj4+Pj4+ICAgwqDCoMKgwqB1
bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4+Pj4+Pgo+Pj4+Pj4gSG93ZXZlciB0aGUgc3Bp
IGJpbmRpbmcgcmVxdWlyZXMgdG8gaW50cm9kdWNlIGEgdW5pdCBhZGRyZXNzOgo+Pj4+Pj4gcGF0
dGVyblByb3BlcnRpZXM6Cj4+Pj4+PiAgIMKgwqAgJ15wb3J0QFswLTldJzoKPj4+Pj4+ICAgwqDC
oMKgwqAgJHJlZjogYXVkaW8tZ3JhcGgtcG9ydC55YW1sIwo+Pj4+Pj4gICDCoMKgwqDCoCB1bmV2
YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4+Pj4+Pgo+Pj4+Pj4gVGhlIHdhcm5pbmcgY2FuIGJl
IHJlbW92ZWQgYnkgcmUtb3JkZXJpbmcgdGhlIGJpbmRpbmdzIHBhdGNoZXMgaW4gdGhlIHNlcmll
LAo+Pj4+Pj4gYXMgImFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlIiBtYWtlcyB0aGUgY2hlY2sg
bW9yZSB0b2xlcmFudCBvbiBleHRyYQo+Pj4+Pj4gcHJvcGVydGllcy4KPj4+Pj4KPj4+Pj4gVGhh
dCdzIG5ldmVyIHJpZ2h0Lgo+Pj4+Pgo+Pj4+Pj4gVGhlIHBhdGNoICJBU29DOiBkdC1iaW5kaW5n
czogc3RtMzI6IGkyczogYWRkIGF1ZGlvLWdyYXBoLWNhcmQgcG9ydCIgY2FuCj4+Pj4+PiBldmVu
IGJlIG1lcmVseSBkcm9wcGVkLgo+Pj4+Pj4gU28sIEkgc3VnZ2VzdCB0byByZXNlbmQgdGhlIHNl
cmllIHdpdGhvdXQgYXVkaW8tZ3JhcGgtY2FyZCBwYXRjaC4KPj4+Pj4KPj4+Pj4gT25seSBpZiB5
b3UgYXJlbid0IHVzaW5nIGF1ZGlvLWdyYXBoLWNhcmQuCj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gRG9l
cyBpdCBzb3VuZCB0b28gcGVybWlzc2l2ZSB0byB5b3UgPwo+Pj4+Pgo+Pj4+PiBJIHRoaW5rIHBl
cmhhcHMgeW91IG5lZWQgdG8gY29tYmluZSB0aGUgc2NoZW1hcyBpbnRvIDEuIE9yIHlvdSBuZWVk
IHRvCj4+Pj4+IHJlc3RydWN0dXJlIHlvdXIgZHRzaSBmaWxlcyBzdWNoIHRoYXQgeW91IG9ubHkg
YWRkIHNwaSBzcGVjaWZpYwo+Pj4+PiBwcm9wZXJ0aWVzIHdoZW4gc3BpIG1vZGUgaXMgZW5hYmxl
ZCBhbmQgb25seSBhZGQgaTJzIHNwZWNpZmljIHByb3BlcnRpZXMKPj4+Pj4gd2hlbiBpMnMgbW9k
ZSBpcyBlbmFibGVkLiBPciB1c2UgdGhlIC9kZWxldGUtcHJvcGVydHkvIGRpcmVjdGl2ZS4KPj4+
Pgo+Pj4+IEluaXRpYWxseSB0aGUgYWltIG9mIHRoaXMgc2VyaWVzIHdhcyB0byBmaXggYSAibWFr
ZSBXPTEiIHdhcm5pbmdzIHNlZW4gb24gc3BpIGFuZCBpMnMgbm9kZXMgKGR1cGxpY2F0ZSB1bml0
LWFkZHJlc3MpLiBNb3ZpbmcgYm90aCBub2RlcyBpbiBhIGNvbW1vbiBub2RlICsgdXNpbmcgYSBk
aWZmZXJlbnQgY29tcGF0aWJsZSBkZXBlbmRpbmcgb24gU1BJIG9yIEkyUyB1c2FnZSBzb3VuZGVk
IGdvb2QpIGJ1dCBpdCBpcyBub3QgZW5vdWdoLiBJbiB0aGlzIHNlcmllcyB0aGUgY29tbW9uIG5v
ZGUgaXMgbmFtZWQgYXMgZm9sbG93aW5nOiAic3BpMnMyOiBzcGlANDAwMGIwMDAiLiBJdCBpcyBm
aW5lIGZvciBhIHNwaSB1c2FnZSBidXQgaWYgd2Ugd2FudCB0byB1c2UgdGhpcyAiY29tbW9uIG5v
ZGUiIHdpdGggSTJTIGNvbXBhdGlibGUgYW5kIHNwZWNpZmljIGJpbmRpbmdzLCB0aGUgbm9kZSBu
YW1lIHJlbWFpbnMgc3BpQC4uLiBhbmQgdGhlbiBzcGVjaWZpYyBzcGkgY2hlY2tzIGFyZSBkb25l
LiBGb3IgdGhpcyB3aXRoIHRoaXMgc2VyaWVzIGFwcGxpZWQgd2UgZ290IHRoaXMgaXNzdWUgcmVw
b3J0ZWQgYnkgc3BpLWNvbnRyb2xsZXIueWFtbDoKPj4+Pgo+Pj4+IHNwaUA0MDAwYjAwMDogcG9y
dEAwOiAnY29tcGF0aWJsZScgaXMgYSByZXF1aXJlZCBwcm9wZXJ0eQo+Pj4+Cj4+Pj4gU28sIGlm
IHdlIHVzZSB0d28gc2VwYXJhdGVzIG5vZGVzIHdlIGdvdCBXPTEgd2FybmluZyBhbmQgaWYgd2Ug
dXNlIGEgY29tbW9uIG5vZGUgd2UgZ290IHlhbWwgY2hlY2sgaXNzdWUuIE9uZSBwb3NzaWJpbGl0
eSB3b3VsZCBiZSB0byB1c2UgYSBjb21tb24gbm9kZSB3aXRoIGEgbmV3IG5vZGUgbmFtZSAoZm9y
IGV4YW1wbGUgaTJzcGlALi4uKSBidXQgSSB0aGluayBpdCBpcyBub3QgYWNjZXB0YWJsZS4KPj4+
Pgo+Pj4+IEhvdyB0byBwcm9ncmVzcyA/Cj4+Pgo+Pj4gQXRtZWwgRmxleGNvbSBjYW4gYmUgY29u
ZmlndXJlZCB0byBiZSBlaXRoZXIgVUFSVCwgU1BJIG9yIGkyYy4gRnVuY3Rpb25zCj4+PiBhcmUg
Y2hpbGQgbm9kZXMgb2YgdGhlIGZsZXhjb20gbm9kZSBhbmQgdGhlIE1GRCBkcml2ZXIgbWF0Y2hp
bmcgYWdhaW5zdCBpdCwKPj4+IGp1c3QgY29uZmlndXJlIHRoZSBvcGVyYXRpbmcgbW9kZSBhbmQg
dGhlbiBjYWxscyBvZl9wbGF0Zm9ybV9wb3B1bGF0ZS4KPj4+Cj4+PiBXb3VsZCBzb21ldGhpbmcg
YWxvbmcgdGhlc2UgbGluZXMgZml0IGhlcmUgYXMgd2VsbD8KPj4KPj4gWWVzIGl0IGNvdWxkIGJ1
dCBpbiBteSBtaW5kIGl0IHdhcyBub3QgYSBNRkQgYXMgYm90aCBmZWF0dXJlIGNhbm5vdCBiZSB1
c2VkCj4+IGF0IHRoZSBzYW1lIHRpbWU6IGl0IGlzIGVpdGhlciBTUEkgb3IgSTJTIGFuZCBjaG9p
Y2UgaXMgZG9uZSAic3RhdGljYWxseSIgaW4KPj4gZGV2aWNlIHRyZWUgZGVwZW5kaW5nIGJvYXJk
IHVzYWdlLgo+Pgo+PiBMZWUsIHdoYXQgaXQgaXMgeW91ciBmZWVsaW5nIGFib3V0IHRoYXQgPyBX
aWxsIHlvdSBhY2NlcHQgdG8gYWRkIGEgTUZECj4+IGRyaXZlciBmb3IgdGhpcyBTUEkvSTJTIHBl
cmlwaGVyYWwgd2hvc2UgcHJ1cnBvc2UgaXMgb25seSB0byBwb3B1bGF0ZSBjaGlsZAo+PiBub2Rl
IChlaXRoZXIgU1BJIG9yIEkyUykgPwo+IAo+ICBGcm9tIHlvdXIgZGVzY3JpcHRpb24sIHRoaXMg
ZG9lc24ndCBzb3VuZCBsaWtlIGEgZ29vZCBmaXQgZm9yIE1GRC4KClRoYW5rcyBMZWUgZm9yIHlv
dXIgcXVpY2sgYW5zd2VyLiBTbyByZW5hbWUgdGhlIG5vZGUgZnJvcCBzcGlALi4uIHRvIAppMnNw
aUAuLi4gKG9yIHNvbWV0aGluZyBlbHNlKSBsb29rcyBsaWtlIHRvIGJlIHRoZSBvbmx5IHNvbHV0
aW9uLiAKRGVwZW5kaW5nIHRoZSBjb21wYXRpYmxlIHVzZWQgdGhlIHdlbGwgc2NoZW1hIHdpbGwg
YmUgdXNlZCAoaWYgd2VsbCAKcmVmZXJlbmNlZCBpbiBlYWNoIHN0bTMyIHNwaSBhbmQgaTJzIHlh
bWwgZmlsZXMpOgoKLS0+IHNwaS1jb250cm9sbGVyLnlhbWwgaW4gY2FzZSBvZiAic3Qsc3RtMzJo
Ny1zcGkiCgotLT5hdWRpby1jb250cm9sbGVyIGluIGNhc2Ugb2YgInN0LHN0bTMyaDctaTJzIgoK
Um9iLCBkbyB5b3UgYWdyZWU/CgpyZWdhcmRzCmFsZXgKCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
