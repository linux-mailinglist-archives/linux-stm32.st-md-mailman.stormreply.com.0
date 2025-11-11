Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A26BC4EBFC
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Nov 2025 16:19:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4202C349C4;
	Tue, 11 Nov 2025 15:19:57 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35E94C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 15:19:56 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-8804650ca32so42449166d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 07:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762874395; x=1763479195;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A5SVOaFDlCV2uNNJy3v3HZSAyck/afp0AOlD6vgrWKk=;
 b=NknSBJQfu23roWDIv1kL3RsVV2VJ39/fMO9dpSdmBF0rdp5uRnPoU80txUUxvrHvdT
 apeOUt9XLJf+0pzXu4a69wcFWp7I1N6GW4PHpdermJuh5R+2I6IuzT17sZJKvZiEXGdm
 Or1Orj35kWPqLxzcZi8q+OaerpV7Vb/YZG2cku05GZJaJtfNG+bpvzG3ut4R8Kh5nzAK
 l/eKZYAr39iZ6wrfSSQHFqAR78GpbEPwyYLxZgejlEUlKyMyDrGA3CD8DpPMLpm5mO3/
 46lb0Y0O6Qjpb1WMZQYyBfW8BLh7BBAeHn7a/8gNUdBvrEHcBK0t/B2cgCCGx45B1wEG
 ulog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762874395; x=1763479195;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A5SVOaFDlCV2uNNJy3v3HZSAyck/afp0AOlD6vgrWKk=;
 b=iJ+vlxcy5T+2ZUO2nSCjWD0YxKZzpI0HQP5PQuE8bHZNlZefp9PZ3bPXziamvkFdYH
 8YDYSAmrGJQdIgizrXpyOSQwugQqCTMlEd/IM0Alkr0zj0H8NAkSJ7roHaf/rPL5N1/l
 fPmT7zokuexZZPV90aYKRTDLSwIQ0OV0q/B0XS0jPCm4+SCG4WBfdSh/5ncdj6DVtjNT
 BlAXDLkD13jm8VrnzO17JLJGRjKfpJg7l0qhTNXLBeSTvl9ImVYfr3rLOwdVqstd2r+l
 SQWajWU+lksDB2uNLREtQBG35B+9lXRq14dhaIDDOIx7b3hSo9y01cQeP4M+1BAJ1BLd
 yUMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcxbvr5Pucp+tCqcSTzq3bDhPMM3rFctJbtu3G8uvu5Wa+c4WjdOfO7l5hdgKZljL/omlZv6kTckn+aA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwHFZ0bLgTNP9yH2Uao1XKhFYeShKS0wbEtnKvVXx4Crc1r3Fc9
 3FjwlBMVqrkdT7frD3KZtpkUnZfvU3NkNxm30CH04I3L1kSuiKzExVBc
X-Gm-Gg: ASbGncujeSOPU37stE1g0JGF49U0PfpL+55uf5C8x806vGfBXeRrEycRlQJ61ijYLmW
 0oeG10Cg+iOZAIlXSnqk1iheYgvf3N1l1tHGwEsFfiih59QST0yAxG0qywUJhvqMS0lRXgx9voG
 A9BALXNqGfeYtuNPwo2eboZb7vnPiHheYQXvce9a5co/RmEx+Ku1v35o0I7t/CRsB4pBg1+OQYz
 CGVw4mV8dXQEPQr9N79DLzq7yJcWSzEejhnl+5DB4EYB0ZO54iKZOWMzGH1QJpuZW/JOKFDeVKj
 i/LichnRQMxacDA96NYjgik97XqjaufkCZ6yinENLqhJ9UKnsz4UQZV3IA41rHOErSDic1kzcNp
 qAwC8II+GgxFJdLklW4pLOA2eY8GiQAtDaNbw4ueJmHQpICcJ1qGO/zzZkn9/OaLjchOuZpnkJ6
 RPvPNPbIQgDbguyMa0379H9mie
X-Google-Smtp-Source: AGHT+IFAbbyQhephY+AI/cqoiVmNsBG/fPVAb6kdOEXVVnWOQfxDiV/20VWcE/IFvlGD21yeGrFzgA==
X-Received: by 2002:a05:6214:21c4:b0:880:5636:6241 with SMTP id
 6a1803df08f44-88238769402mr175766236d6.65.1762874394765; 
 Tue, 11 Nov 2025 07:19:54 -0800 (PST)
Received: from ?IPV6:2620:10d:c0a8:11d1::1065? ([2620:10d:c091:400::5:ddc])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88238b4c3c0sm72793516d6.33.2025.11.11.07.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 07:19:54 -0800 (PST)
Message-ID: <9fed6ab9-e748-4a78-b45b-5e6b3cc58006@gmail.com>
Date: Tue, 11 Nov 2025 10:19:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Saeed Mahameed <saeed@kernel.org>, Jakub Kicinski <kuba@kernel.org>
References: <20251107204347.4060542-1-daniel.zahka@gmail.com>
 <20251107204347.4060542-3-daniel.zahka@gmail.com> <aQ7f1T1ZFUKRLQRh@x130>
 <jhmdihtp63rblcjiy2pibhnz2sikvbm6bhnkclq3l2ndxgbqbb@e3t23x2x2r46>
 <20251110154643.66d15800@kernel.org> <aRKs6jXqSvC3G_R0@x130>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <aRKs6jXqSvC3G_R0@x130>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Brett Creeley <brett.creeley@amd.com>, linux-doc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jerin Jacob <jerinj@marvell.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 linux-stm32@st-md-mailman.stormreply.com, Linu Cherian <lcherian@marvell.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Leon Romanovsky <leon@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Srujana Challa <schalla@marvell.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 intel-wired-lan@lists.osuosl.org, Dave Ertman <david.m.ertman@intel.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sunil Goutham <sgoutham@marvell.com>,
 Jiri Pirko <jiri@resnulli.us>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ido Schimmel <idosch@nvidia.com>, Roger Quadros <rogerq@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Michael Chan <michael.chan@broadcom.com>, linux-omap@vger.kernel.org,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, linux-arm-kernel@lists.infradead.org,
 Petr Machata <petrm@nvidia.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mark Bloch <mbloch@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 hariprasad <hkelam@marvell.com>, Simon Horman <horms@kernel.org>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Johannes Berg <johannes@sipsolutions.net>, Vladimir Oltean <olteanv@gmail.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Geetha sowjanya <gakula@marvell.com>,
 Vlad Dumitrescu <vdumitrescu@nvidia.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/2] net/mlx5: implement
 swp_l4_csum_mode via devlink params
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

CgpPbiAxMS8xMC8yNSAxMDoyNiBQTSwgU2FlZWQgTWFoYW1lZWQgd3JvdGU6Cj4gT24gMTAgTm92
IDE1OjQ2LCBKYWt1YiBLaWNpbnNraSB3cm90ZToKPj4gT24gU3VuLCA5IE5vdiAyMDI1IDExOjQ2
OjM3ICswMTAwIEppcmkgUGlya28gd3JvdGU6Cj4+PiA+U28sIEkgY2hlY2tlZCBhIGNvdXBsZSBv
ZiBmbG93cyBpbnRlcm5hbGx5LCBhbmQgaXQgc2VlbXMgdGhpcyBhbGxvd3MKPj4+ID5zb21lIGZs
ZXhpYmlsaXR5IGluIHRoZSBGVyB0byBkZWNpZGUgbGF0ZXIgb24gd2hpY2ggbW9kZSB0byBwaWNr
LAo+Pj4gPmJhc2VkIG9uIG90aGVyIHBhcmFtZXRlcnMsIHdoaWNoIHByYWN0aWNhbGx5IG1lYW5z
Cj4+PiA+InVzZXIgaGFzIG5vIHByZWZlcmVuY2Ugb24gdGhpcyBwYXJhbSIuIERyaXZlciBjYW4g
b25seSBmaW5kIG91dAo+Pj4gPmFmdGVyIGJvb3QsIHdoZW4gaXQgcmVhZHMgdGhlIHJ1bnRpbWUg
Y2FwYWJpbGl0aWVzLCBidXQgc3RpbGwKPj4+ID50aGlzIGlzIGEgYnVnLCBieSB0aGUgdGltZSB0
aGUgZHJpdmVyIHJlYWRzIHRoaXMgKGluIGRldmxpbmspLCB0aGUKPj4+ID5kZWZhdWx0IHZhbHVl
IHNob3VsZCd2ZSBhbHJlYWR5IGJlZW4gZGV0ZXJtaW5lZCBieSBGVywgc28gRlcgbXVzdAo+Pj4g
PnJldHVybiB0aGUgYWN0dWFsIHJ1bnRpbWUgdmFsdWUuIFdoaWNoIGNhbiBvbmx5IGJlIG9uZSBv
ZiB0aGUgCj4+PiBmb2xsb3dpbmcKPj4+Cj4+PiBJIGRvbid0IHRoaW5rIGl0IGlzIGNvcnJlY3Qg
dG8gZXhwb3NlIHRoZSAiZGVmYXVsdCIgYXMgYSB2YWx1ZS4KPj4+Cj4+PiBPbiByZWFkLCB1c2Vy
IHNob3VsZCBzZWUgdGhlIGNvbmZpZ3VyZWQgdmFsdWUsIGVpdGhlciAiZnVsbF9jc3VtIiBvcgo+
Pj4gImw0X29ubHkiLiBSZXBvcnRpbmcgImRlZmF1bHQiIHRvIHRoZSB1c2VyIGRvZXMgbm90IG1h
a2UgYW55IHNlbnNlLgo+Pj4gT24gd3JpdGUsIHVzZXIgc2hvdWxkIHBhc3MgZWl0aGVyICJmdWxs
X2NzdW0iIG9yICJsNF9vbmx5Ii4gV2h5IHdlIAo+Pj4gd291bGQKPj4+IGV2ZXIgd2FudCB0byBw
YXNzICJkZWZhdWx0Ij8KPj4KPj4gRldJVyBJIGFncmVlIHRoYXQgdGhpcyBmZWVscyBhIGJpdCBv
ZGQuIFNob3VsZCB0aGUgZGVmYXVsdCBiZSBhIGZsYWcKPj4gYXR0cj8gT24gZ2V0IGZsYWcgYmVp
bmcgcHJlc2VudCBtZWFucyB0aGUgdmFsdWUgaXMgdGhlIEZXIGRlZmF1bHQgKG5vCj4+IG92ZXJy
aWRlIHByZXNlbnQpLiBPbiBzZXQgcGFzc2luZyB0aGUgZmxhZyBtZWFucyB1c2VyIHdhbnRzIHRv
IHJlc2V0Cj4+IHRvIEZXIGRlZmF1bHQgKHJlbW92ZSBvdmVycmlkZSk/Cj4+Cj4+PiBSZWdhcmRs
ZXNzIHRoaXMgcGF0Y2gsIHNpbmNlIHRoaXMgaXMgcGFyYW0gdG8gYmUgcmVmbGVjdGVkIG9uIGZ3
IHJlYm9vdAo+Pj4gKHBlcm1hbmVudCBjbW9kZSksIEkgdGhpbmsgaXQgd291bGQgYmUgbmljZSB0
byBleHBvc2UgaW5kaWNhdGlvbiBpZgo+Pj4gcGFyYW0gdmFsdWUgcGFzc2VkIHRvIHVzZXIgY3Vy
cmVudGx5IGFmZmVjdHMgdGhlIGZ3LCBvciBpZiBpdCBpcyBnb2luZwo+Pj4gdG8gYmUgYXBwbGll
ZCBhZnRlciBmdyByZWJvb3QuIFBlcmhhcHMgYSBzaW1wbGUgYm9vbCBhdHRyIHdvdWxkIGRvPwo+
Pgo+PiBJSVVDIHdlJ3JlIGJhc2ljYWxseSB0YWxraW5nIGFib3V0IHVzZXIgaGF2aW5nIG5vIGlu
Zm9ybWF0aW9uIHRoYXQKPj4gdGhlIHVwZGF0ZSBpcyBwZW5kaW5nPyBDb3VsZCB0aGlzIGJlIGRv
bmUgYnkgdGhlIGNvcmU/IENvcmUgY2FuIGRvCj4+IGEgLT5nZXQgcHJpb3IgdG8gY2FsbGluZyAt
PnNldCBhbmQgaWYgdGhlIC0+c2V0IHN1Y2NlZWRzIGFuZAo+PiBjbW9kZSAhPSBydW50aW1lIHJl
Y29yZCB0aGF0IHRoZSB1cGRhdGUgaXMgcGVuZGluZz8KPj4KPgo+IENvdWxkIHdvcmsgaWYgb24g
R0VUIGRyaXZlciByZWFkcyAnY3VycmVudCcgdmFsdWUgZnJvbSBGVywgdGhlbiBpdCBzaG91bGQK
PiBiZSBzaW1wbGVyIGlmIEdFVCAhPSBTRVQgdGhlbiAncGVuZGluZycsIG9uZSBwcm9ibGVtIHRo
b3VnaCBpcyBpZiBTRVQgd2FzCj4gZG9uZSBieSBleHRlcm5hbCB0b29sIG9yIHZhbHVlIHdhc24n
dCBhcHBsaWVkIGFmdGVyIHJlYm9vdCwgdGhlbiB3ZSBsb29zZQo+IHRoYXQgaW5mb3JtYXRpb24s
IGJ1dCBkbyB3ZSBjYXJlPyBJIHRoaW5rIHdlIHNob3VsZG4ndC4KPgo+PiBUaGF0IGZlZWxzIHZl
cnkgc2VwYXJhdGUgZnJvbSB0aGUgc2VyaWVzIHRobywgdGhlcmUgYXJlIDMgcGVybWFuZW50Cj4+
IHBhcmFtcyBpbiBtbHg1LCBhbHJlYWR5LiBJcyB0aGVyZSBzb21ldGhpbmcgdGhhdCBtYWtlcyB0
aGlzIG9uZSBzcGVjaWFsPwo+Cj4gSW4gbWx4NSB0aGV5IGFsbCBoYXZlIHRoZSBzYW1lIGJlaGF2
aW9yLCBkZXZsaW5rIHNldHMgJ25leHQnIHZhbHVlLCAKPiBkZXZsaW5rIHJlYWRzICduZXh0JyB2
YWx1ZS4gVGhlIG9ubHkgc3BlY2lhbCB0aGluZyBhYm91dCB0aGUgbmV3IHBhcmFtCj4gaXMgdGhh
dCBpdCBoYXMgYSAnZGV2aWNlX2RlZmF1bHQnIHZhbHVlIGFuZCB3aGVuIHlvdSByZWFkIHRoYXQg
ZnJvbSAKPiAnbmV4dCcgaXQgd2lsbCBhbHdheXMgc2hvdyAnZGV2aWNlX2RlZmF1bHQnIGFzIHRo
ZSBhY3R1YWwgdmFsdWUgaXMgb25seQo+IGtub3duIGF0IHJ1biB0aW1lICxlLmcuICduZXh0IGJv
b3QnLgo+Cj4gSSB0aGluayB0aGUgb25seSB2YWxpZCBzb2x1dGlvbiBmb3IgcGVybWFuZW50IGFu
ZCBkcnZfaW5pdCBwYXJhbXMgaXMgdG8KPiBoYXZlICduZXh0JyBhbmQgJ2N1cnJlbnQnIHZhbHVl
cyByZXBvcnRlZCBieSBkcml2ZXIgb24gcmVhZC4gT3IgbWF5YmUgCj4gZ28ganVzdCB3aXRowqAg
J3NldCcgIT0gJ2dldCcgdGhlbiAncGVuZGluZycgYXMgZGlzY3Vzc2VkIGFib3ZlID8KPgoKVGhl
IGRyaXZlciByZXBvcnRpbmcgJ2N1cnJlbnQnIGFuZCAnbmV4dCcgbWFrZXMgdGhlIG1vc3Qgc2Vu
c2UgdG8gbWUuIAoncGVuZGluZycgd291bGQganVzdCBiZSBpbXBsaWVkIHRoZW4uIFRoZSAnc2V0
JyAhPSAnZ2V0JyB0aGVuICdwZW5kaW5nJyAKYXBwcm9hY2ggd291bGQgbm90IHdvcmsgb24gbXkg
bXVsdGkgaG9zdCBDWDcgc3lzdGVtLCB3aGVyZSByZWJvb3RpbmcgdGhlIApob3N0cyBpbmRpdmlk
dWFsbHkgZG9lcyBub3QgdHJpZ2dlciBhIGZ3IHJlc2V0LgoKVG8gYmUgY2xlYXIsIGFyZSB3ZSB3
aWxsaW5nIHRvIGdvIGZvcndhcmQgd2l0aCB0cmVhdGluZyBzd3BfbDRfY3N1bV9tb2RlIApsaWtl
IG90aGVyIHBlcm1hbmVudCBwYXJhbXMgaW4gbnZfcGFyYW0uYyBpbiB0aGlzIHNlcmllcywgYW5k
IHRoZW4gZGVmZXIgCnRoZSAncGVuZGluZycgc29sdXRpb24gdG8gYW5vdGhlciBzZXJpZXM/Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
