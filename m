Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B70C948E86A
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jan 2022 11:41:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67045C5F1F5;
	Fri, 14 Jan 2022 10:41:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1402CCFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 10:41:54 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20E9K1Y7028639;
 Fri, 14 Jan 2022 11:41:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Db8QoLf2xpm+lVoXBntS8ts6R2As6iUdm19chCVqc50=;
 b=YnGikFqXTkWXyKKI6gP9Hdz6hNUbt8VIMw4oFehA6YMpaIGn5VhmHtKn79MMXAsFPSNW
 ++ywwrN9bYLBgipIHKnNNIdTEh6e3zbryXjbawXxOSng1j/7bb8fWEMg4g/3H0dDdg2p
 la50Lc+9ujAG6kr7kj7cBoNstHn6WZ76bsHCFzF5pcwMouAYa1HaTYWw2ZVoWUVrsP+z
 a46wuBZ/VEwvQtjGPM5XI/JoYtXy9kdqtDGplfFKe5w44RaAx1EbtU2NRJjyoajASj3v
 Ft9Hl9/UXGQRPSC14GLETN95FZQx0lv3Oqg+fVXbruPEKar8EAqawewUz7nNKNHVZV9l 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dk6eygfch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 11:41:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E71BB100034;
 Fri, 14 Jan 2022 11:41:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DC5AA21231F;
 Fri, 14 Jan 2022 11:41:09 +0100 (CET)
Received: from lmecxl1137.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 14 Jan
 2022 11:41:08 +0100
To: Philippe Cornu <philippe.cornu@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro
 Carvalho Chehab <mchehab@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Liam Mark
 <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <john.stultz@linaro.org>, Christian
 Konig <christian.koenig@amd.com>, <soc@kernel.org>
References: <20220113171921.17466-1-philippe.cornu@foss.st.com>
 <20220113171921.17466-3-philippe.cornu@foss.st.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <7bd3229c-8b66-6a4f-4fed-cd1929f2c397@foss.st.com>
Date: Fri, 14 Jan 2022 11:41:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113171921.17466-3-philippe.cornu@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_04,2022-01-14_01,2021-12-02_01
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/2] MAINTAINERS: update drm/stm drm/sti
 and cec/sti maintainers
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

Ck9uIDEvMTMvMjIgNjoxOSBQTSwgUGhpbGlwcGUgQ29ybnUgd3JvdGU6Cj4gQWRkIEFsYWluIGFz
IHN0aSBtYWludGFpbmVyIGZvciBib3RoIGRybS9zdGkgJiBjZWMvc3RpLgo+IEFkZCBSYXBoYcOr
bCBhcyBzdG0gbWFpbnRhaW5lciBmb3IgZHJtL3N0bS4KPgo+IFNpZ25lZC1vZmYtYnk6IFBoaWxp
cHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBmb3NzLnN0LmNvbT4KPiAtLS0KPiAgTUFJTlRBSU5F
UlMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgoKSGkgUGhpbGlw
cGUsCgoKUmV2aWV3ZWQtYnk6IFJhcGhhZWwgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1w
b3VAZm9zcy5zdC5jb20+CgoKVGhhbmsgeW91ICEgOkQKUmFwaGHDq2wKCgo+Cj4gZGlmZiAtLWdp
dCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCA2YmVhMDgwZDAxNTkuLjcwOGY4
Yzg2ZTRjOSAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4g
QEAgLTY0MjMsNiArNjQyMyw3IEBAIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3JvY2tjaGlwLwo+ICBGOglkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvCj4gIAo+
ICBEUk0gRFJJVkVSUyBGT1IgU1RJCj4gK006CUFsYWluIFZvbG1hdCA8YWxhaW4udm9sbWF0QGZv
c3Muc3QuY29tPgo+ICBMOglkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gIFM6CU1h
aW50YWluZWQKPiAgVDoJZ2l0IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0t
bWlzYwo+IEBAIC02NDMxLDYgKzY0MzIsNyBAQCBGOglkcml2ZXJzL2dwdS9kcm0vc3RpCj4gIAo+
ICBEUk0gRFJJVkVSUyBGT1IgU1RNCj4gIE06CVlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRy
ZUBmb3NzLnN0LmNvbT4KPiArTToJUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlz
LXBvdUBmb3NzLnN0LmNvbT4KPiAgTToJUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QGZv
c3Muc3QuY29tPgo+ICBMOglkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gIFM6CU1h
aW50YWluZWQKPiBAQCAtMTgxNTIsNiArMTgxNTQsNyBAQCBGOglEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc291bmQvc3Qsc3RpLWFzb2MtY2FyZC50eHQKPiAgRjoJc291bmQvc29j
L3N0aS8KPiAgCj4gIFNUSSBDRUMgRFJJVkVSCj4gK006CUFsYWluIFZvbG1hdCA8YWxhaW4udm9s
bWF0QGZvc3Muc3QuY29tPgo+ICBTOglNYWludGFpbmVkCj4gIEY6CURvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdGloLWNlYy50eHQKPiAgRjoJZHJpdmVycy9tZWRpYS9j
ZWMvcGxhdGZvcm0vc3RpLwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
