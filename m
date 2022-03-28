Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 637724E96D2
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Mar 2022 14:37:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DA24C5C842;
	Mon, 28 Mar 2022 12:37:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE63BC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 12:37:55 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22S8Jr1s017538;
 Mon, 28 Mar 2022 14:37:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=PRSUOkbjhbLZbdipmTB0fmY4CfFxVYPER1xJPcVCusk=;
 b=GND7worVS6mA7ZXXW7V81FZ/BD6+o/Yo1ksdttq6DgyRCkO4AxsgshfrPJ8hqliCtafS
 MMr0eK4bT/qd5/Z3bnELbfPK5hs5LNt9pBgJouBKWLxcwQZFlRRz/C2bj5Ahq7Zjehbr
 /QIRaEmTtHc9AZdQHbnFF40wIvz7MHuAYNxAAiuChN7mFZ402kf6YTNe7r4BoH+MaQRI
 o7BeNbCs5PGvzl/Ckairnt/Iqse9KcZdwEgr9cpzkOjHGT/22tEKzXIImOz8Ql6OZePi
 xjbuH/nBXkYT/a78Q9BfJaCw4eXTFAeoQXUU7o2O+vw+c16n1i704lkw4t6DVDW9Fytv og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1s4p1r08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 14:37:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 86AE710002A;
 Mon, 28 Mar 2022 14:37:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7629C22D163;
 Mon, 28 Mar 2022 14:37:38 +0200 (CEST)
Received: from [10.201.21.216] (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 28 Mar
 2022 14:37:37 +0200
Message-ID: <be2042d2-e315-223d-5454-ebfb934f9d2d@foss.st.com>
Date: Mon, 28 Mar 2022 14:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>, <yannick.fertre@foss.st.com>
References: <20220327055355.3808-1-xiam0nd.tong@gmail.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20220327055355.3808-1-xiam0nd.tong@gmail.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_04,2022-03-28_01,2022-02-23_01
Cc: marex@denx.de, daniel@ffwll.ch, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, stable@vger.kernel.org,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGVsbG8gWGlhb21lbmcKCk9uIDMvMjcvMjIgMDc6NTMsIFhpYW9tZW5nIFRvbmcgd3JvdGU6Cj4g
VGhlIHR3byBidWdzIGFyZSBoZXJlOgo+IAlpZiAoZW5jb2Rlcikgewo+IAlpZiAoYnJpZGdlICYm
IGJyaWRnZS0+dGltaW5ncykKPgo+IFRoZSBsaXN0IGl0ZXJhdG9yIHZhbHVlICdlbmNvZGVyL2Jy
aWRnZScgd2lsbCAqYWx3YXlzKiBiZSBzZXQgYW5kCj4gbm9uLU5VTEwgYnkgZHJtX2Zvcl9lYWNo
X2VuY29kZXIoKS9saXN0X2Zvcl9lYWNoX2VudHJ5KCksIHNvIGl0IGlzCj4gaW5jb3JyZWN0IHRv
IGFzc3VtZSB0aGF0IHRoZSBpdGVyYXRvciB2YWx1ZSB3aWxsIGJlIE5VTEwgaWYgdGhlCj4gbGlz
dCBpcyBlbXB0eSBvciBubyBlbGVtZW50IGlzIGZvdW5kLgo+Cj4gVG8gZml4IHRoZSBidWcsIHVz
ZSBhIG5ldyB2YXJpYWJsZSAnKl9pdGVyJyBhcyB0aGUgbGlzdCBpdGVyYXRvciwKPiB3aGlsZSB1
c2UgdGhlIG9sZCB2YXJpYWJsZSAnZW5jb2Rlci9icmlkZ2UnIGFzIGEgZGVkaWNhdGVkIHBvaW50
ZXIKPiB0byBwb2ludCB0byB0aGUgZm91bmQgZWxlbWVudC4KPgo+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4gRml4ZXM6IDk5ZTM2MDQ0MmYyMjMgKCJkcm0vc3RtOiBGaXggYnVzX2ZsYWdz
IGhhbmRsaW5nIikKPiBTaWduZWQtb2ZmLWJ5OiBYaWFvbWVuZyBUb25nIDx4aWFtMG5kLnRvbmdA
Z21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDE2ICsrKysr
KysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgoKVGhhbmtzIGZvciB5b3VyIGZpeAoKQWNrZWQtYnk6IFJhcGhhZWwgR2FsbGFpcy1Q
b3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+CgoKUmFwaGHDq2wgR2FsbGFpcy1Q
b3UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
