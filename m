Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9570CCC17B7
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 09:10:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49C88C8F266;
	Tue, 16 Dec 2025 08:10:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0FCCC87EDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 07:38:53 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BG5HUIH175708
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 16 Dec 2025 07:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7YmBFkv7BIT1XO2FEXzhMg2xQ1XFzff8WD9iA8ZhYH0=; b=XTFIjUfvzx+0WxwS
 dxYZGhHRtRb7qI1JBA4pcqy6vbKSOyzJdExYWJot4nyNC5bP1PQTwaol4/9nrFRR
 cNpfYq+0xplBniApzuR6QM64JR4xlSIG1ySWQmd+F+q6RI4c/HRYUQu+unYmDuNv
 ovH/RzLAz31fw6dCPurnScEOA3yMEOiKC7huhtgQOpmNCpjlfq4Dztq5qNeiqYLY
 jHTLvHGqClBMGi7s6HFS3MNm4vkXZAJdCNq/6X4u1Sqy1Q4F4BpI2jYe9sKTsM8i
 1uZY0wuJCCs9kowVxYLa+FqZz23OiYWlzDcNPQ/wsbuvItrhExVtvoTS5xD/yNst
 ibD+sw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2kmm3f64-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 07:38:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-bdced916ad0so7775041a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 23:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765870731; x=1766475531;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7YmBFkv7BIT1XO2FEXzhMg2xQ1XFzff8WD9iA8ZhYH0=;
 b=kGyYGycsMS1vNdoRDSPflW6EoWWqe8PAUDfLTYRMhZCPeXXIqw0ixw/HJmAEbPyTy6
 nxH+W1d7D2Hd6uUIqjope027r4+PaKFkxP5dxYtafd0SpJlbpj96zpATp63oIkKdzlmY
 SvHCfG2Cp9eUcccsDa6n/9ejK4G+4mhLak8vYx7kx22sgvlll71AVLEFVA5dlxHQjchd
 5t5xoZSWy/bE7eSBzrytbeZo8uow3ItCeg1WFsFp1xCwHQPQ03UINjh/ks3Q2JVcHDeV
 SuYXg7+108OO9Dc3DByNT6jibhTw2EtEdmpLzu27O+BJE63WmNUIPnMPYHz03llx6UDx
 lw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765870731; x=1766475531;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7YmBFkv7BIT1XO2FEXzhMg2xQ1XFzff8WD9iA8ZhYH0=;
 b=aakMYk7qjd2Gp1LdfRWsssZC6785MaGJtmIyFZSLcTQaxwlxFa4RMyIMFw5M7RZbrp
 o3TFD6fWxOIjFnOfAM7k3yZKa1SRLpHNM60j0z+xA+DBupa2yNuaFMOg0JK6ZPo4X3KK
 dn3bMbf0lSTHWRvAQIgzoCs12cQA9ylUw06TE6Q/Oufgo/zTIbTn7s4XpbnwULqCuYpG
 zND44MdYbcUKQ5kajOSoH6PXsBNykBTSN1r4szcU4NhgBikx1kQU1kl4/DZRZgGMFTAB
 fjhZFup3xjg7c101PqDVvpyKOh0Bqxm0xgVHtHtI7XBhpPXZDjkGFokj8c1eqfYGgtph
 cFTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX33TbXyxtbeUHt5aY/7VDA9ckCdJGgSdGoX/MqeXqHIbbHqf9TBkiBigvshhRSE+33ViXq9chhgLwJbQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxBVtSGp15HYy0+BspVw9Y+20eSwkPuKXRyJ9hetllvFlWJE57B
 94vkGWNTyWLS63Mvxi2fgV2dZO5WvaOZ8UbR0Xn7e/voVujuFAWdtILSyCCOZ1QcNtcCDCnvywb
 Jj+tFsrvta4VP5RHg3LtynzI8yr6mnPCPcDb8WsNDcuX/EJQkUKd2fOlU1lOGkQDx0Uzmq2YDxI
 31x9DUXctJO1SBhk+p4W1rA4FPdWydIpzVxHFdk+BaxNzDTBi6PyzMaA2YLQ==
X-Gm-Gg: AY/fxX6nHW393qxAjJHmtsFqH/qBx9FnRI4aVbl+uDnBhJSveS54wZkEgNyOzPblmXa
 eivd6gNGiaJmnc4Ki0fEYcttvOfGMiyz6sbccvvKCy93lnZDTv44ALGh0qU1aKJnKlUy/r0D5m7
 9TafOVEZ1+7rtWmYdQd0s5Zjld5eUjzethCaiJQn1hsXaQZzzfZmA8kT6+xM5xxpWidA8=
X-Received: by 2002:a05:7300:2a9b:b0:2a4:3593:6453 with SMTP id
 5a478bee46e88-2ac2f85e872mr8049912eec.3.1765870731071; 
 Mon, 15 Dec 2025 23:38:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgAxeScCHPFScnumP+kyrXe4heJGwYVQRSxj+hObliMSDxJWWHv5hYUxaMExJMrxhceQO+g6cVj0vLQa5OEdY=
X-Received: by 2002:a05:7300:2a9b:b0:2a4:3593:6453 with SMTP id
 5a478bee46e88-2ac2f85e872mr8049887eec.3.1765870730525; Mon, 15 Dec 2025
 23:38:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <aT--ox375kg2Mzh-@sumit-X1>
 <dhunzydod4d7vj73llpuqemxb5er2ja4emxusr66irwf77jhhb@es4yd2axzl25>
In-Reply-To: <dhunzydod4d7vj73llpuqemxb5er2ja4emxusr66irwf77jhhb@es4yd2axzl25>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:08:38 +0530
X-Gm-Features: AQt7F2pIGEo3k7l40jiSNtQzSXPgQLv36wLttu_75OXJz9aTmVe9GGZBfjh5ELU
Message-ID: <CAGptzHOOqLhBnAXDURAzkgckUvRr__UuF1S_7MLV0u-ZxYEdyA@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA2MiBTYWx0ZWRfX/KC/EYdnH/3s
 hy1nz3Gb0hCFe1dHSd1EkUb/GOMvNTqQtCXGSbUiDPP48jvAhaWCzitpV2MoRZCJzZ1awHkA+l3
 r9jdYbSKLdgpn2ViAY+0hUQjfC+E0Gl1Fpk/w7l03dWeFw1WKD9Z3CDwJ1o/GRich0N9JtzWiaG
 9I1Yb7Ox18wNDFUk8qWYq+K0UNiERd8+Ia5sI7Oxhpt+KSHvkcKoA4VjL3V5LGLpI/wN7JMDCm+
 yRM4S92HHh/yVfdgOgZWAn5Jr69/3HGSw9KmryV4HdJvvrKU+Ekoa2OS5bLvIoHUgjDGfJEHq0n
 tPejIn7TG3AYvx0Fr9ps1lKj5JHJLmAc11bvnWYDko/4fCTTHMtLuzFGi4JVaRFMDEg3Pm0Bjp/
 502FsUG1HA/otBtMk6CMoZjH2B3qEQ==
X-Proofpoint-GUID: Ge2boGznwwmN-57RjL1JzG2a7xuIX4dj
X-Proofpoint-ORIG-GUID: Ge2boGznwwmN-57RjL1JzG2a7xuIX4dj
X-Authority-Analysis: v=2.4 cv=EcTFgfmC c=1 sm=1 tr=0 ts=69410c8c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=IpJZQVW2AAAA:8
 a=sfbzD7rgGHNppxHmi9UA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160062
X-Mailman-Approved-At: Tue, 16 Dec 2025 08:10:20 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-efi@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>, Ard Biesheuvel <ardb@kernel.org>,
 linux-rtc@vger.kernel.org, linux-security-module@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 James Morris <jmorris@namei.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jason Gunthorpe <jgg@ziepe.ca>, Cristian Marussi <cristian.marussi@arm.com>,
 arm-scmi@vger.kernel.org,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, op-tee@lists.trustedfirmware.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sumit Garg <sumit.garg@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Michael Chan <michael.chan@broadcom.com>, linux-arm-kernel@lists.infradead.org,
 Paul Moore <paul@paul-moore.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>,
 linux-integrity@vger.kernel.org, Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v1 00/17] tee: Use bus callbacks instead
	of driver callbacks
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

SGkgVXdlLAoKT24gTW9uLCBEZWMgMTUsIDIwMjUgYXQgMzowMuKAr1BNIFV3ZSBLbGVpbmUtS8O2
bmlnCjx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPiB3cm90ZToKPgo+IEhlbGxvIFN1bWl0
LAo+Cj4gT24gTW9uLCBEZWMgMTUsIDIwMjUgYXQgMDQ6NTQ6MTFQTSArMDkwMCwgU3VtaXQgR2Fy
ZyB3cm90ZToKPiA+IE9uIFRodSwgRGVjIDExLCAyMDI1IGF0IDA2OjE0OjU0UE0gKzAxMDAsIFV3
ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gPiBIZWxsbywKPiA+ID4KPiA+ID4gdGhlIG9iamVj
dGl2ZSBvZiB0aGlzIHNlcmllcyBpcyB0byBtYWtlIHRlZSBkcml2ZXIgc3RvcCB1c2luZyBjYWxs
YmFja3MKPiA+ID4gaW4gc3RydWN0IGRldmljZV9kcml2ZXIuIFRoZXNlIHdlcmUgc3VwZXJzZWRl
ZCBieSBidXMgbWV0aG9kcyBpbiAyMDA2Cj4gPiA+IChjb21taXQgNTk0YzgyODFmOTA1ICgiW1BB
VENIXSBBZGQgYnVzX3R5cGUgcHJvYmUsIHJlbW92ZSwgc2h1dGRvd24KPiA+ID4gbWV0aG9kcy4i
KSkgYnV0IG5vYm9keSBjYXJlZCB0byBjb252ZXJ0IGFsbCBzdWJzeXN0ZW1zIGFjY29yZGluZ2x5
Lgo+ID4gPgo+ID4gPiBIZXJlIHRoZSB0ZWUgZHJpdmVycyBhcmUgY29udmVydGVkLiBUaGUgZmly
c3QgY29tbWl0IGlzIHNvbWV3aGF0Cj4gPiA+IHVucmVsYXRlZCwgYnV0IHNpbXBsaWZpZXMgdGhl
IGNvbnZlcnNpb24gKGFuZCB0aGUgZHJpdmVycykuIEl0Cj4gPiA+IGludHJvZHVjZXMgZHJpdmVy
IHJlZ2lzdHJhdGlvbiBoZWxwZXJzIHRoYXQgY2FyZSBhYm91dCBzZXR0aW5nIHRoZSBidXMKPiA+
ID4gYW5kIG93bmVyLiAoVGhlIGxhdHRlciBpcyBtaXNzaW5nIGluIGFsbCBkcml2ZXJzLCBzbyBi
eSB1c2luZyB0aGVzZQo+ID4gPiBoZWxwZXJzIHRoZSBkcml2ZXJzIGJlY29tZSBtb3JlIGNvcnJl
Y3QuKQo+ID4gPgo+ID4gPiBUaGUgcGF0Y2hlcyAjNCAtICMxNyBkZXBlbmQgb24gdGhlIGZpcnN0
IHR3bywgc28gaWYgdGhleSBzaG91bGQgYmUKPiA+ID4gYXBwbGllZCB0byB0aGVpciByZXNwZWN0
aXZlIHN1YnN5c3RlbSB0cmVlcyB0aGVzZSBtdXN0IGNvbnRhaW4gdGhlIGZpcnN0Cj4gPiA+IHR3
byBwYXRjaGVzIGZpcnN0Lgo+ID4KPiA+IFRoYW5rcyBVd2UgZm9yIHlvdXIgZWZmb3J0cyB0byBj
bGVhbiB1cCB0aGUgYm9pbGVycGxhdGUgY29kZSBmb3IgVEVFIGJ1cwo+ID4gZHJpdmVycy4KPgo+
IFRoYW5rcyBmb3IgeW91ciBmZWVkYmFjay4gSSB3aWxsIHByZXBhcmUgYSB2MiBhbmQgYWRkcmVz
cyB5b3VyIGNvbW1lbnRzCj4gKHdoaXRlc3BhY2UgaXNzdWVzIGFuZCB3cm9uZyBjYWxsYmFjayBp
biB0aGUgc2h1dGRvd24gbWV0aG9kKS4KPgo+ID4gPiBOb3RlIHRoYXQgYWZ0ZXIgcGF0Y2ggIzIg
aXMgYXBwbGllZCwgdW5jb252ZXJ0ZWQgZHJpdmVycyBwcm92b2tlIGEKPiA+ID4gd2FybmluZyBp
biBkcml2ZXJfcmVnaXN0ZXIoKSwgc28gaXQgd291bGQgYmUgZ29vZCBmb3IgdGhlIHVzZXIKPiA+
ID4gZXhwZXJpZW5jZSBpZiB0aGUgd2hvbGUgc2VyaWVzIGdvZXMgaW4gZHVyaW5nIGEgc2luZ2xl
IG1lcmdlIHdpbmRvdy4KPiA+Cj4gPiArMQo+ID4KPiA+IEkgc3VnZ2VzdCB0aGUgd2hvbGUgc2Vy
aWVzIGdvZXMgdmlhIHRoZSBKZW5zIHRyZWUgc2luY2UgdGhlcmUgc2hvdWxkbid0Cj4gPiBiZSBh
bnkgY2hhbmNlcyBmb3IgY29uZmxpY3QgaGVyZS4KPiA+Cj4gPiA+IFNvCj4gPiA+IEkgZ3Vlc3Mg
YW4gaW1tdXRhYmxlIGJyYW5jaCBjb250YWluaW5nIHRoZSBmcmlzdCB0aHJlZSBwYXRjaGVzIHRo
YXQgY2FuCj4gPiA+IGJlIG1lcmdlZCBpbnRvIHRoZSBvdGhlciBzdWJzeXN0ZW0gdHJlZXMgd291
bGQgYmUgc2Vuc2libGUuCj4gPiA+Cj4gPiA+IEFmdGVyIGFsbCBwYXRjaGVzIGFyZSBhcHBsaWVk
LCB0ZWVfYnVzX3R5cGUgY2FuIGJlIG1hZGUgcHJpdmF0ZSB0bwo+ID4gPiBkcml2ZXJzL3RlZSBh
cyBpdCdzIG5vdCB1c2VkIGluIG90aGVyIHBsYWNlcyBhbnkgbW9yZS4KPiA+ID4KPiA+Cj4gPiBG
ZWVsIGZyZWUgdG8gbWFrZSB0aGUgdGVlX2J1c190eXBlIHByaXZhdGUgYXMgdGhlIGxhc3QgcGF0
Y2ggaW4gdGhlIHNlcmllcwo+ID4gc3VjaCB0aGF0IGFueSBmb2xsb3d1cCBkcml2ZXIgZm9sbG93
cyB0aGlzIGNsZWFuIGFwcHJvYWNoLgo+Cj4gVGhlcmUgaXMgYSBiaXQgbW9yZSB0byBkbyBmb3Ig
dGhhdCB0aGFuIEknbSB3aWxsaW5nIHRvIGludmVzdC4gV2l0aCBteQo+IHBhdGNoIHNlcmllcyBh
cHBsaWVkIGB0ZWVfYnVzX3R5cGVgIGlzIHN0aWxsIHVzZWQgaW4KPiBkcml2ZXJzL3RlZS9vcHRl
ZS9kZXZpY2UuYyBhbmQgZHJpdmVycy90ZWUvdGVlX2NvcmUuYy4KCk9oIEkgc2VlLCBJIGd1ZXNz
IHdlIG5lZWQgdG8gY29tZSB3aXRoIHNvbWUgaGVscGVycyBhcm91bmQgZGV2aWNlCnJlZ2lzdGVy
L3VucmVnaXN0ZXIgZnJvbSBURUUgc3Vic3lzdGVtIGFzIHdlbGwuIExldCdzIHBsYW4gdGhhdCBm
b3IgYQpmb2xsb3d1cCBwYXRjaC1zZXQsIEkgZG9uJ3Qgd2FudCB0aGlzIHBhdGNoLXNldCB0byBi
ZSBibG9hdGVkIG1vcmUuCgo+IE1heWJlIGl0J3MKPiBzZW5zaWJsZSB0byBtZXJnZSB0aGVzZSB0
d28gZmlsZXMgaW50byBhIHNpbmdsZSBvbmUuCgpJdCdzIG5vdCBwb3NzaWJsZSBhcyB0aGUgZGVz
aWduIGZvciBURUUgYnVzIGlzIHRvIGhhdmUgVEVFCmltcGxlbWVudGF0aW9uIGRyaXZlcnMgbGlr
ZSBPUC1URUUsIEFNRC1URUUsIFRTLVRFRSwgUVRFRSBhbmQgc28gb24gdG8KcmVnaXN0ZXIgZGV2
aWNlcyBvbiB0aGUgYnVzLgoKPgo+IFRoZSB0aGluZ3MgSSB3b25kZXIgYWJvdXQgYWRkaXRpb25h
bGx5IGFyZToKPgo+ICAtIGlmIENPTkZJR19PUFRFRT1uIGFuZCBDT05GSUdfVEVFPXl8bSB0aGUg
dGVlIGJ1cyBpcyBvbmx5IHVzZWQgZm9yCj4gICAgZHJpdmVycyBidXQgbm90IGRldmljZXMuCgpZ
ZWFoIHNpbmNlIHRoZSBkZXZpY2VzIGFyZSByYXRoZXIgYWRkZWQgYnkgdGhlIFRFRSBpbXBsZW1l
bnRhdGlvbiBkcml2ZXIuCgo+Cj4gIC0gb3B0ZWVfcmVnaXN0ZXJfZGV2aWNlKCkgY2FsbHMgZGV2
aWNlX2NyZWF0ZV9maWxlKCkgb24KPiAgICAmb3B0ZWVfZGV2aWNlLT5kZXYgYWZ0ZXIgZGV2aWNl
X3JlZ2lzdGVyKCZvcHRlZV9kZXZpY2UtPmRldikuCj4gICAgKEF0dGVudGlvbiBoYWxmLWtub3ds
ZWRnZSEpIEkgdGhpbmsgZGV2aWNlX2NyZWF0ZV9maWxlKCkgc2hvdWxkIG5vdAo+ICAgIGJlIGNh
bGxlZCBvbiBhbiBhbHJlYWR5IHJlZ2lzdGVyZWQgZGV2aWNlIChvciB5b3UgaGF2ZSB0byBzZW5k
IGEKPiAgICB1ZXZlbnQgYWZ0ZXJ3YXJkcykuIFRoaXMgc2hvdWxkIHByb2JhYmx5IHVzZSB0eXBl
IGF0dHJpYnV0ZSBncm91cHMuCj4gICAgKE9yIHRoZSBuZWVkX3N1cHBsaWNhbnQgYXR0cmlidXRl
IHNob3VsZCBiZSBkcm9wcGVkIGFzIGl0IGlzbid0IHZlcnkKPiAgICB1c2VmdWwuIFRoaXMgd291
bGQgbWF5YmUgYmUgY29uc2lkZXJlZCBhbiBBQkkgY2hhbmdlIGhvd2V2ZXIuKQoKVGhlIHJlYXNv
bmluZyBmb3IgdGhpcyBhdHRyaWJ1dGUgc2hvdWxkIGJlIGV4cGxhaW5lZCBieSBjb21taXQ6Cjcy
NjljYmE1M2Q5MCAoInRlZTogb3B0ZWU6IEZpeCBzdXBwbGljYW50IGJhc2VkIGRldmljZSBlbnVt
ZXJhdGlvbiIpLgpJbiBzdW1tYXJ5IGl0J3MgZHVlIHRvIGEgd2VpcmQgZGVwZW5kZW5jeSBmb3Ig
ZGV2aWNlcyB3ZSBoYXZlIHdpdGggdGhlCnVzZXItc3BhY2UgZGFlbW9uOiB0ZWUtc3VwcGxpY2Fu
dC4KCj4KPiAgLSBXaHkgZG9lcyBvcHRlZV9wcm9iZSgpIGluIGRyaXZlcnMvdGVlL29wdGVlL3Nt
Y19hYmkuYyB1bnJlZ2lzdGVyIGFsbAo+ICAgIG9wdGVlIGRldmljZXMgaW4gaXRzIGVycm9yIHBh
dGggKG9wdGVlX3VucmVnaXN0ZXJfZGV2aWNlcygpKT8KClRoaXMgaXMgbW9zdGx5IHRvIHRha2Ug
Y2FyZSBvZiBpZiBhbnkgZGV2aWNlIGdvdCByZWdpc3RlcmVkIGJlZm9yZSB0aGUKZmFpbHVyZSBv
Y2N1cmVkLiBMZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBhIGJldHRlciB3YXkgdG8gYWRkcmVzcyB0
aGF0LgoKLVN1bWl0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
