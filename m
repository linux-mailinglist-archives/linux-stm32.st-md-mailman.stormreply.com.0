Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBFEC310F5
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 13:51:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27EA7C62ECF;
	Tue,  4 Nov 2025 12:51:22 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F2F1C62ECD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 12:51:20 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-81efcad9c90so63793176d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Nov 2025 04:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762260679; x=1762865479;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eNACkyQqVSo6Hmo5PjkrfufaeZZc3fNY7YlAuWMuRq0=;
 b=Hyux7zsLRp60uBLrZTlN3KJuqwiVG6fD3Cgo84r7ZryD5v/RoEUMlIYTVtPvvTWm2t
 07ri5+8ifpjJTRBTWulcATBNO7gVOflodaQ0l1ehmPqC/YwcJBqao2lsvo7C4g6EA6nk
 5OvLzXujFGdaLn6uosQ8g9LZka6Waa7eXbf0Aze9w5pOL0cCMJUbI2lDIL0x5qenD4VU
 VF/LpBm9lO4ONI44TIXnnwnU2uA84p+2sIyW0Cb/fil2ELWvo9IRfczBc3+bIAScdWBf
 5vc5+jlSYdixyDjynMwzfgphzXplfP2AO0/vbMYhyP16Ux+3Ap32TCZCZPTAEPNzkkEt
 ZFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762260679; x=1762865479;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eNACkyQqVSo6Hmo5PjkrfufaeZZc3fNY7YlAuWMuRq0=;
 b=ELT/K+WsOUnQZujZtIkecTs1pVcHfGGNGJxI5xaP79cBKjjbdDsn5xBOf9bTcaeZoy
 FYatgj/BVc5hRIawXVtM8KLQFrf7UegagY4QIJVaMf81RgZ+TZPX9G0S4NUi57beOQyd
 5kOiSQpLG2ddioIj1ndRGA8KjPFbmsGLva1h1FDiziIaQWy9jDlKGUGybdEvE7R+dA59
 2qeQLiRnhiIeZ1cU8Q/wFhRnwm3JwSsOtfQGUKV5p71GkfPxmkj1UAPT3i3dFwMPk/RW
 kby1hmgu7XjgeUZTI+uSQ2B4uHz1yE7TCh5aPPJ5Zm5dc1VrBgcZQbbYpKb40h4ybpR9
 /jsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0Xd3UpfAhllAY8A0B9SAVkyCpVgV6qpmGx20tyJFt/o74u7rVVZiykXFIB/92r5Qx3Lf3W1BidWCJnA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzIcT76wC2Hsj88Xrkrfh/iSRna6AxpjbmwytPw3JNmBIf2Pnu7
 OdjEsAnwUmLRZc93qQdqxzip0XQVQLIoRsqQexYToMh4Ay98L2lYtzlE
X-Gm-Gg: ASbGnctUyHRw0AczlHxepRsz74E2INAD2krLK6g6EK07drabvMjDYyZgtrHgUfJT2/d
 U3wlbNpXQwuiJwaMo6PTMDMt7NBa7wI713L5hvhFzCZ2J/xBwBvCTRU1p1kMT3W6UKz1oQXZH4Z
 7DKhFQ2ZMFh2FSqCzHHteUuZ1h1UTRgInQ5XNj+5+rsRVbfiSlPSsPkWNq6j+wsmcQ7OdhT9CtQ
 fMtcivcjjyuUFRFsKY2K0xRBoyfq1T6cw4V8HsakzvyH0kTLG/G04E2z79hc9wKPxeJW3zYqCOZ
 sGoPM/ES4rnZchjp0WCdF9LC5gxVOZWyimOJsCfN+fATZSm1JwKITMIKzMEnWG39eg+pBWsq0qD
 d9eMM0mleROX/PAOtpFZA8q/pWrL1QVx3pL2/YN0uNm5Z/3CS4OWI/2azXFywEpEETB8sGFd7g4
 A8WM9p3O57pZ+vz7VIqnq8fSJ+nRsqJD8cMmhHotvBkMfP4Id8j21mqxw=
X-Google-Smtp-Source: AGHT+IFm58ty03czXFexlH5hj0mLZA/g2M5F1UsdQEG3Wd5VnU77sQjl9srK3J0v7dmYKkp7SqLOlQ==
X-Received: by 2002:a05:6214:262e:b0:880:5edf:d177 with SMTP id
 6a1803df08f44-8805edfd5b5mr52809046d6.11.1762260678910; 
 Tue, 04 Nov 2025 04:51:18 -0800 (PST)
Received: from ?IPV6:2600:4040:93b8:5f00:52dd:c164:4581:b7eb?
 ([2600:4040:93b8:5f00:52dd:c164:4581:b7eb])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88060e906efsm19114706d6.45.2025.11.04.04.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 04:51:18 -0800 (PST)
Message-ID: <6aa2f011-3ba5-4614-950d-d8f0ec62222b@gmail.com>
Date: Tue, 4 Nov 2025 07:51:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Zahka <daniel.zahka@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>
References: <20251103194554.3203178-1-daniel.zahka@gmail.com>
 <20251103194554.3203178-3-daniel.zahka@gmail.com>
 <mhm4hkz52gmqok56iuiukdcz2kaowvppbqrfi3zxuq67p3otit@5fhpgu2axab2>
 <db5c46b4-cc66-48bb-aafb-40d83dd3620c@gmail.com>
Content-Language: en-US
In-Reply-To: <db5c46b4-cc66-48bb-aafb-40d83dd3620c@gmail.com>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Brett Creeley <brett.creeley@amd.com>, Dave Ertman <david.m.ertman@intel.com>,
 linux-doc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jerin Jacob <jerinj@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 linux-stm32@st-md-mailman.stormreply.com, Linu Cherian <lcherian@marvell.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Leon Romanovsky <leon@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Srujana Challa <schalla@marvell.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Bharat Bhushan <bbhushan2@marvell.com>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sunil Goutham <sgoutham@marvell.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ido Schimmel <idosch@nvidia.com>,
 Roger Quadros <rogerq@kernel.org>,
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/2] net/mlx5: implement
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

CgpPbiAxMS80LzI1IDY6MzggQU0sIERhbmllbCBaYWhrYSB3cm90ZToKPgo+Cj4gT24gMTEvNC8y
NSA1OjE0IEFNLCBKaXJpIFBpcmtvIHdyb3RlOgo+PiBJIGRpZCBzb21lIHJlc2VhcmNoLiAwL0RF
VklDRV9ERUZBVUxUIHNob3VsZCBub3QgYmUgZXZlciByZXBvcnRlZCBiYWNrCj4+IGZyb20gRlcu
IEl0J3MgcHVycG9zZSBpcyBmb3IgdXNlciB0byByZXNldCB0byBkZWZhdWx0IEZXIGNvbmZpZ3Vy
YXRpb24uCj4+IFdoYXQncyB0aGUgdXNlY2FzZSBmb3IgdGhhdD8gSSB0aGluayB5b3UgY291bGQg
anVzdCBhdm9pZAo+PiAwL0RFVklDRV9ERUZBVUxUIGVudGlyZWx5LCBmb3IgYm90aCBnZXQgYW5k
IHNldC4KPgo+IEkgZmluZCB0aGF0IDAvREVWSUNFX0RFRkFVTFQgaXMgcmVwb3J0ZWQgYmFjayBv
biBteSBkZXZpY2UuIEkgaGF2ZSAKPiBvYnNlcnZlZCB0aGlzIHNhbWUgYmVoYXZpb3Igd2hlbiB1
c2luZyB0aGUgbXN0Y29uZmlnIHRvb2wgZm9yIHNldHRpbmcgCj4gdGhlIHBhcmFtZXRlciB0b28u
CgplLmcuCiQgZG1lc2cgfCBncmVwIC1pIG1seCB8IGdyZXAgLWkgZmlybXdhcmUKW8KgIMKgMTAu
MTY1NzY3XSBtbHg1X2NvcmUgMDAwMDowMTowMC4wOiBmaXJtd2FyZSB2ZXJzaW9uOiAyOC40Ni4x
MDA2CgokIC4vbXN0Y29uZmlnIC1kIDAxOjAwLjAgLWIgLi9tbHhjb25maWdfaG9zdC5kYiBxdWVy
eSBTV1BfTDRfQ0hFQ0tTVU1fTU9ERQoKRGV2aWNlICMxOgotLS0tLS0tLS0tCgpEZXZpY2UgdHlw
ZTrCoCDCoCDCoCDCoCBDb25uZWN0WDcKTmFtZTrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoENYNzEx
NDNETUMtQ0RBRV9GQl9BeApEZXNjcmlwdGlvbjrCoCDCoCDCoCDCoCBDb25uZWN0WC03IEV0aGVy
bmV0IGFkYXB0ZXIgY2FyZDsgMTAwIEdiRSBPQ1AzLjA7IApTaW5nbGUtcG9ydCBRU0ZQOyBNdWx0
aSBIb3N0OyAyIEhvc3Q7IFBDSWUgNC4wIHgxNjsgQ3J5cHRvIGFuZCBTZWN1cmUgQm9vdApEZXZp
Y2U6wqAgwqAgwqAgwqAgwqAgwqAgwqAwMTowMC4wCgpDb25maWd1cmF0aW9uczrCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBOZXh0
IEJvb3QKIMKgIMKgIMKgIMKgIFNXUF9MNF9DSEVDS1NVTV9NT0RFIERFVklDRV9ERUZBVUxUKDAp
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
