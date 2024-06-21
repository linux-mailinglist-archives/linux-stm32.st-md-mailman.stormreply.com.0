Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 666049126BC
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 15:34:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16D8DC7128D;
	Fri, 21 Jun 2024 13:34:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5239C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 13:33:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LB3BRq021260;
 Fri, 21 Jun 2024 15:33:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 7V0RclItNFdKo29WOSpHddexvDxa6KYtY5l56bgncyo=; b=joQzu6Pf829wWuft
 mvJv87vpSqWVXiOZWA+bAqqmzslUFyEAvPJuzYRN+lI0yNlCl+M+uPn7exIwGDkQ
 bgxV/lz9d1yWH5QkfCyCpH73vz2G5cz+njQMV5CYx7tTwE8xXfrP9nB9aVJfVkpp
 EITOg+lucS4jbqqjnAJt5Z+10Kzc0PPv5OH8jI4NZ7LRy/hxO5AkiyvogIdd7piN
 m+hb+DtY9tk7heqkHsTK4wdwsCc7KLL5dPXMSZcD0JUs4xCU4wJ/IrE20E61zs6X
 8O7lpsr99DGIRiBaRACWH45Isxcv2y5dgyJFWpN4wKqg9RL3Md/iLtW0ak9DPDba
 ShZsZA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yvrkbkvv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jun 2024 15:33:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B679B40044;
 Fri, 21 Jun 2024 15:33:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2B4D221942;
 Fri, 21 Jun 2024 15:32:54 +0200 (CEST)
Received: from [10.48.87.177] (10.48.87.177) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 21 Jun
 2024 15:32:54 +0200
Message-ID: <902e6037-9ba9-41ab-bfd0-a25fe2c26bce@foss.st.com>
Date: Fri, 21 Jun 2024 15:32:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Katya Orlova <e.orlova@ispras.ru>
References: <20240216125040.8968-1-e.orlova@ispras.ru>
 <0b91cb58-b9ca-4c67-b15a-77c60bc2ee18@foss.st.com>
 <ef635048bc7b4521be09ca06c66b57a5@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <ef635048bc7b4521be09ca06c66b57a5@foss.st.com>
X-Originating-IP: [10.48.87.177]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_05,2024-06-21_01,2024-05-17_01
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, lvc-project@linuxtesting.org
Subject: Re: [Linux-stm32] TR: [PATCH v4] drm/stm: Avoid use-after-free
 issues with crtc and plane
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

SGkgS2F0eWEsCgp0aGFua3MgZm9yIHRoZSBwYXRjaC4KClRlc3RlZC1ieTogWWFubmljayBGZXJ0
cmUgPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgoKQlIKCkxlIDE5LzAzLzIwMjQgw6AgMTQ6
NDcsIFBoaWxpcHBlIENPUk5VIC0gZm9zcyBhIMOpY3JpdMKgOgo+IHp1dCwgZMOpasOgIHVuIGFj
a2VkLWJ5IGRlIFJHQS4uLgo+IHR1IGNvbmZpcm1lcyBxdWUgamUgcHJlbmRzPwo+IFBoaWxpcHBl
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IERlIDogUmFwaGFl
bCBHQUxMQUlTLVBPVSAtIGZvc3MKPiBFbnZvecOpIDogbHVuZGkgMjYgZsOpdnJpZXIgMjAyNCAx
NDo1MAo+IMOAIDogS2F0eWEgT3Jsb3ZhCj4gQ2MgOiBZYW5uaWNrIEZFUlRSRSAtIGZvc3M7IFBo
aWxpcHBlIENPUk5VIC0gZm9zczsgRGF2aWQgQWlybGllOyBEYW5pZWwgVmV0dGVyOyBNYXhpbWUg
Q29xdWVsaW47IEFsZXhhbmRyZSBUT1JHVUUgLSBmb3NzOyBQaGlsaXBwIFphYmVsOyBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGx2Yy1wcm9qZWN0QGxpbnV4dGVzdGluZy5vcmcKPiBPYmpl
dCA6IFJlOiBbUEFUQ0ggdjRdIGRybS9zdG06IEF2b2lkIHVzZS1hZnRlci1mcmVlIGlzc3VlcyB3
aXRoIGNydGMgYW5kIHBsYW5lCj4KPiBPbiAyLzE2LzI0IDEzOjUwLCBLYXR5YSBPcmxvdmEgd3Jv
dGU6Cj4+IGx0ZGNfbG9hZCgpIGNhbGxzIGZ1bmN0aW9ucyBkcm1fY3J0Y19pbml0X3dpdGhfcGxh
bmVzKCksCj4+IGRybV91bml2ZXJzYWxfcGxhbmVfaW5pdCgpIGFuZCBkcm1fZW5jb2Rlcl9pbml0
KCkuIFRoZXNlIGZ1bmN0aW9ucwo+PiBzaG91bGQgbm90IGJlIGNhbGxlZCB3aXRoIHBhcmFtZXRl
cnMgYWxsb2NhdGVkIHdpdGggZGV2bV9remFsbG9jKCkKPj4gdG8gYXZvaWQgdXNlLWFmdGVyLWZy
ZWUgaXNzdWVzIFsxXS4KPj4KPj4gVXNlIGFsbG9jYXRpb25zIG1hbmFnZWQgYnkgdGhlIERSTSBm
cmFtZXdvcmsuCj4+Cj4+IEZvdW5kIGJ5IExpbnV4IFZlcmlmaWNhdGlvbiBDZW50ZXIgKGxpbnV4
dGVzdGluZy5vcmcpLgo+Pgo+PiBbMV0KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC91
MzY2aTc2ZTNxaGgzcmE1b3hydG5nanRtMnU1bHRlcmtla2N6NnkyamtuZGh1eHpsaUBkaXVqb240
aDdxd2IvCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEthdHlhIE9ybG92YSA8ZS5vcmxvdmFAaXNwcmFz
LnJ1Pgo+IEhpIEthdHlhLAo+Cj4KPiBUaGFua3MgZm9yIHRoaXMgc3VibWlzc2lvbi4KPgo+IEFj
a2VkLWJ5OiBSYXBoYcOrbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0
LmNvbT4KPgo+Cj4gUmVnYXJkcywKPiBSYXBoYcOrbAo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
