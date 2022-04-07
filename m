Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 425D84F7ACB
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Apr 2022 11:01:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF35CC628A2;
	Thu,  7 Apr 2022 09:01:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1B42C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Apr 2022 09:01:29 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 23743g5e001248;
 Thu, 7 Apr 2022 11:01:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=1ezUATS7YucgATnJzZ/8KE0ypMPsbEqbkpxpFXJwO8U=;
 b=3Ll0G2zY4iXhpM85f2y+tpuAkUiZ6MD+ymFHIxX5IdzbfmP9Rv2LnfP+hejpS+l/tsGx
 0t8+fixaS+WItL/S+j7XXa0Yt+K/U7T+iBrUb2rz51bPN3vkg0IFzodk8NFSgdnKyE+e
 +rxyiWuAJh8OZ2+1p+5cgd9EB6gm6QrdTtuPL0a0z+k07TWVAvM8S+cyG6GLxoMv0Nc4
 uEJmSTd3vkoDxAXOKJtKpfmOePhh+b1NTtDjobiwX190HbtdLnBzeXE9a7APjqgxLY/5
 IUgldEdtq/qcdBNeiicTIZduR6tKo/Cw25+ODeHmxY+89tj9NGu8DPYtD28IUexIr9jY Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f6du13hsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 11:01:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B9A3B10002A;
 Thu,  7 Apr 2022 11:01:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9EE16215159;
 Thu,  7 Apr 2022 11:01:20 +0200 (CEST)
Received: from [10.201.22.81] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 7 Apr
 2022 11:01:19 +0200
Message-ID: <f2d9d0e9-aecf-6436-6ff5-56b4ccb98f6c@foss.st.com>
Date: Thu, 7 Apr 2022 11:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Xiaomeng Tong
 <xiam0nd.tong@gmail.com>, <yannick.fertre@foss.st.com>
References: <20220327055355.3808-1-xiam0nd.tong@gmail.com>
 <be2042d2-e315-223d-5454-ebfb934f9d2d@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <be2042d2-e315-223d-5454-ebfb934f9d2d@foss.st.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_13,2022-04-06_01,2022-02-23_01
Cc: marex@denx.de, daniel@ffwll.ch, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stm: ltdc: fix two incorrect NULL checks
	on list iterator
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

CgpPbiAzLzI4LzIyIDE0OjM3LCBSYXBoYWVsIEdhbGxhaXMtUG91IHdyb3RlOgo+IEhlbGxvIFhp
YW9tZW5nCj4gCj4gT24gMy8yNy8yMiAwNzo1MywgWGlhb21lbmcgVG9uZyB3cm90ZToKPj4gVGhl
IHR3byBidWdzIGFyZSBoZXJlOgo+PiAJaWYgKGVuY29kZXIpIHsKPj4gCWlmIChicmlkZ2UgJiYg
YnJpZGdlLT50aW1pbmdzKQo+Pgo+PiBUaGUgbGlzdCBpdGVyYXRvciB2YWx1ZSAnZW5jb2Rlci9i
cmlkZ2UnIHdpbGwgKmFsd2F5cyogYmUgc2V0IGFuZAo+PiBub24tTlVMTCBieSBkcm1fZm9yX2Vh
Y2hfZW5jb2RlcigpL2xpc3RfZm9yX2VhY2hfZW50cnkoKSwgc28gaXQgaXMKPj4gaW5jb3JyZWN0
IHRvIGFzc3VtZSB0aGF0IHRoZSBpdGVyYXRvciB2YWx1ZSB3aWxsIGJlIE5VTEwgaWYgdGhlCj4+
IGxpc3QgaXMgZW1wdHkgb3Igbm8gZWxlbWVudCBpcyBmb3VuZC4KPj4KPj4gVG8gZml4IHRoZSBi
dWcsIHVzZSBhIG5ldyB2YXJpYWJsZSAnKl9pdGVyJyBhcyB0aGUgbGlzdCBpdGVyYXRvciwKPj4g
d2hpbGUgdXNlIHRoZSBvbGQgdmFyaWFibGUgJ2VuY29kZXIvYnJpZGdlJyBhcyBhIGRlZGljYXRl
ZCBwb2ludGVyCj4+IHRvIHBvaW50IHRvIHRoZSBmb3VuZCBlbGVtZW50Lgo+Pgo+PiBDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZwo+PiBGaXhlczogOTllMzYwNDQyZjIyMyAoImRybS9zdG06IEZp
eCBidXNfZmxhZ3MgaGFuZGxpbmciKQo+PiBTaWduZWQtb2ZmLWJ5OiBYaWFvbWVuZyBUb25nIDx4
aWFtMG5kLnRvbmdAZ21haWwuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0
ZGMuYyB8IDE2ICsrKysrKysrKystLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiAKPiBUaGFua3MgZm9yIHlvdXIgZml4Cj4gCj4g
QWNrZWQtYnk6IFJhcGhhZWwgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5z
dC5jb20+Cj4gCj4gCj4gUmFwaGHDq2wgR2FsbGFpcy1Qb3UKPiAKCkFwcGxpZWQgb24gZHJtLW1p
c2MtbmV4dC4KTWFueSB0aGFua3MgZm9yIHlvdXIgcGF0Y2gsClBoaWxpcHBlIDotKQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
