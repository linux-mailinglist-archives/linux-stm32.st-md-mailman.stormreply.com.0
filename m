Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F32669B4CD1
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 16:03:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B64CC71290;
	Tue, 29 Oct 2024 15:03:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30A5DC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 15:03:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TCVZdE022650;
 Tue, 29 Oct 2024 16:02:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 UqeRlTfozsVN09UU+kff1ZF8lDSMEDqo8CyqaqZhk/Y=; b=hZ3d57IqasGvvdZG
 lWbshJF//k5Qp/RAFozM5AQPJ4Ekhf0hoiwUGjy29Wfkcxg3/vzFmJA+3+P8ZsZa
 9Djk1AvxpBqIY2aVpicVA1gxUHfqIomXXRUgJrJTj8IxmmUeGZ/oKutp3r/3Mxu4
 madaH5mK5nf9oBePt5CvuI58AZYFa4tHNQaqkcsEEn7d644OK9i+rjCXW+h1VE3D
 k5gu7aZOYhyaVdmGgutqS0SzmWRYEYK18VyVPknvc/4vGH1mIpvl0pvo0VZRbN0W
 s5KlL+gO64njEl9kYiNuey/0+eI7N8ugDWqh8Ru7Qtd89cQqqca3afuH86kR40Fk
 zkflvQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42gnj4ff7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 16:02:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7183B4002D;
 Tue, 29 Oct 2024 16:01:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A45E26702B;
 Tue, 29 Oct 2024 16:00:04 +0100 (CET)
Received: from [10.48.86.107] (10.48.86.107) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 29 Oct
 2024 16:00:03 +0100
Message-ID: <aeef0000-2b08-4fd5-b834-0ead5c122223@foss.st.com>
Date: Tue, 29 Oct 2024 16:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linus Walleij <linus.walleij@linaro.org>
References: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
 <20241017-arm-kasan-vmalloc-crash-v3-1-d2a34cd5b663@linaro.org>
 <69f71ac8-4ba6-46ed-b2ab-e575dcada47b@foss.st.com>
 <CACRpkdYvgZj1R4gAmzFhf4GmFOxZXhpHVTOio+hVP52OBAJP0A@mail.gmail.com>
 <46336aba-e7dd-49dd-aa1c-c5f765006e3c@foss.st.com>
 <CACRpkdY2=qdY_0GA1gB03yHODPEvxum+4YBjzsXRVnhLaf++6Q@mail.gmail.com>
 <f3856158-10e6-4ee8-b4d5-b7f2fe6d1097@foss.st.com>
 <CACRpkdZa5x6NvUg0kU6F0+HaFhKhVswvK2WaaCSBx3-JCVFcag@mail.gmail.com>
 <CACRpkdYtG3ObRCghte2D0UgeZxkOC6oEUg39uRs+Z0nXiPhUTA@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CACRpkdYtG3ObRCghte2D0UgeZxkOC6oEUg39uRs+Z0nXiPhUTA@mail.gmail.com>
X-Originating-IP: [10.48.86.107]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Mark Rutland <mark.rutland@arm.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kees Cook <kees@kernel.org>, Mark Brown <broonie@kernel.org>,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 1/2] ARM: ioremap: Sync PGDs for
	VMALLOC shadow
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

T24gMTAvMjUvMjQgMjI6NTcsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4+IFdoYXQgaGFwcGVucyBp
ZiB5b3UganVzdAo+Pgo+PiBnaXQgY2hlY2tvdXQgYjY1MDY5ODFmODgwXgo+Pgo+PiBBbmQgYnVp
bGQgYW5kIGJvb3QgdGhhdD8gSXQncyBqdXN0IHJ1bm5pbmcgdGhlIGNvbW1pdCByaWdodCBiZWZv
cmUgdGhlCj4+IHVud2luZGluZyBwYXRjaC4KPiAKPiBBbm90aGVyIHRoaW5nIHlvdSBjYW4gdGVz
dCBpcyB0byBkaXNhYmxlIHZtYXA6ZWQgc3RhY2tzIGFuZCBzZWUKPiB3aGF0IGhhcHBlbnMuIChH
ZW5lcmFsIGFyY2hpdGVjdHVyZS1kZXBlbmRlbnQgb3B0aW9ucyB1bmNoZWNrCj4gIlVzZSBhIHZp
cnR1YWxseS1tYXBwZWQgc3RhY2siLikKCkhpIExpbnVzLAoKSSBoYXZlIHRlc3RlZCB5b3VyIHBh
dGNoZXMgYWdhaW5zdCBmZXcga2VybmVsIHZlcnNpb25zIHdpdGhvdXQgCnJlcHJvZHVjaW5nIHRo
ZSBpc3N1ZS4KLSBiNjUwNjk4MWY4ODBeCi0gdjYuNi40OAotIHY2LjEyLXJjNApJIGRpZG4ndCB0
b3VjaCB0byBDT05GSUdfVk1BUF9TVEFDSyB0aG91Z2guCgpUaGUgbWFpbiBkaWZmZXJlbmNlIGZy
b20gbXkgY3Jhc2ggcmVwb3J0IGlzIG15IHRlc3QgZW52aXJvbm1lbnQgd2hpY2ggCndhcyBhIGRv
d25zdHJlYW0gb25lLgoKU28gaXQgc2VlbXMgcmVsYXRlZCB0byBTVCBkb3duc3RyZWFtIGtlcm5l
bCB2ZXJzaW9uIGJhc2VkIG9uIGEgdjYuNi40OC4KRXZlbiB0aG91Z2ggdGhlIGJhY2t0cmFjZSB3
YXMgdGFsa2luZyBhYm91dCB1bndpbmRpbmcgYW5kIGthc2FuLgoKSSB3aWxsIGNvbnRpbnVlIHRv
IGludmVzdGlnYXRlIG9uIG15IHNpZGUgaW4gdGhlIG5leHQgd2Vla3MgYnV0IEkgZG9uJ3QgCndh
bnQgdG8gYmxvY2sgdGhlIHBhdGNoIGludGVncmF0aW9uIHByb2Nlc3MgaWYgSSB3YXMuCgpCZXN0
IHJlZ2FyZHMsCgpDbMOpbWVudApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
