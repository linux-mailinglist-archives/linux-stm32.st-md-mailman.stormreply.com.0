Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 663182F66D6
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 18:08:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3151EC424C0;
	Thu, 14 Jan 2021 17:08:50 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF0A8C5660F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 17:08:45 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DGrPT0rcqz1rxM2;
 Thu, 14 Jan 2021 18:08:45 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DGrPT0701z1tYVf;
 Thu, 14 Jan 2021 18:08:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id E7Izo8XJ08Ms; Thu, 14 Jan 2021 18:08:43 +0100 (CET)
X-Auth-Info: j5/oSWrPKOZKqEctJwGcj6pvDUo2yJAC2nrnnFWofK4=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 14 Jan 2021 18:08:43 +0100 (CET)
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20201229175521.268234-1-marex@denx.de>
 <c893ad3e-dba2-e1b2-ed7a-24937532d0e6@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <30988ce3-93c2-85be-8039-1a886a3f57dc@denx.de>
Date: Thu, 14 Jan 2021 18:08:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <c893ad3e-dba2-e1b2-ed7a-24937532d0e6@foss.st.com>
Content-Language: en-US
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: Fix GPIO hog flags
	on DHCOM PicoITX
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

T24gMS8xNC8yMSA0OjExIFBNLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+IEhpIE1hcmVrCgpI
aSwKClsuLi5dCgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgt
ZGhjb20tcGljb2l0eC5kdHNpIAo+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRo
Y29tLXBpY29pdHguZHRzaQo+PiBpbmRleCAyNTUyOGExYzA5NmYuLjc1NzcwNzc2NmZhMCAxMDA2
NDQKPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb20tcGljb2l0eC5k
dHNpCj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29tLXBpY29pdHgu
ZHRzaQo+PiBAQCAtNDksNyArNDksNyBAQCAmZ3Bpb2Egewo+PiDCoMKgwqDCoMKgwqAgKi8KPj4g
wqDCoMKgwqDCoCB1c2ItcG9ydC1wb3dlci1ob2cgewo+IAo+IE9uIG15IHRyZWUgdGhpcyBub2Rl
IGlzICJ1c2ItcG9ydC1wb3dlciIuIERvIHlvdSB3YW50IHRvIHVwZGF0ZSB0aGUgbm9kZSAKPiBu
YW1lIHRvbyA/IEkgY2FuIGRvIGl0IGRpcmVjdGx5IGR1cmluZyB0aGUgbWVyZ2UgaWYgeW91IHdh
bnQuCj4gKE5vdGUsIGl0IGlzIHRoZSBjYXNlIGZvciBEUkMwMiBob2cgdXBkYXRlKS4KClBsZWFz
ZSBwaWNrICJbUEFUQ0hdIEFSTTogZHRzOiBzdG0zMjogRml4IEdQSU8gaG9nIG5hbWVzIG9uIERI
Q09NIiAKZmlyc3QsIHRoZW4gdGhpcyBwYXRjaCBzaG91bGQgYXBwbHkgY2xlYW5seS4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
