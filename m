Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 156B794D8AA
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Aug 2024 00:17:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1C61C78021;
	Fri,  9 Aug 2024 22:17:35 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86F62C7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2024 22:17:28 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-3db16b2c1d2so1768399b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Aug 2024 15:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723241847; x=1723846647;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=5kEy5ImbuRfG3E8dfn7QOP7C4wiO9nk+hec1rC2Q+Qs=;
 b=HsG3ALcexnL5JDVszMOcW8qL8REd2y+rrQPrLL/JdkZSgy9kSsNyUoSpuuoE/H4uGZ
 E3kM0pgQ3QXAgYJ2iUDO3XgkS5J4q7rBvs4prlO3Py/gGKgp6Ph5BZ0y3B4B2km4+VIh
 /XQj3S7PaJNXyXoS2jyM4D7T2J7BrXvOlz0gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723241847; x=1723846647;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5kEy5ImbuRfG3E8dfn7QOP7C4wiO9nk+hec1rC2Q+Qs=;
 b=e7lMBmP2rsGiYO4CK4aMD1mnmRrimDe/ma/4OLXxodX40UNN0sjh+zq3uv/tUMR42W
 yWQHVFu4ZLLu024ul27tiRIeAhPcLfgQq04KSKp+jjYiJS4xNWDNBpn055JTLdqVgfKI
 hB3dCaEtzwy2eH665koJBASNbaAa29kBDwZbyXtJltO5rqycWRpJhW7Aac8oIVWcMfR6
 Ev9Djd6F3bBA3hdaN6r+M9ragATdbI5B/gk8oYonw/zoyWL+SzgmroOiWBXNqvQJBKGG
 ccGJh5opk4tbYTqiC4TrIt+iLB6D7XpViSZRwoJF6OT50E5M6LDX58ABnDRjHB93zNkR
 mTRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiuaxQ5Wc0mtlR6XtZVV5dWmcxUvBPx5b6+5RfvZ5yH2Jd0iFv6JiRIl+fg9/ujFkuXA2uobquoqogB+j7QVRpaKj8jA3bcVMvrVzSHAkOBsDUb/eju5wP
X-Gm-Message-State: AOJu0Yz7Mgab3KCEJYxdGYYklbkfrWiA8z2zDImP+EIv2UTD63yPNpP4
 PAQA9p3H9RoR27tnC1ZHBE/KoQVkueLugTYvP8DKqJnPzhq5FN05e1ZJblqwBA==
X-Google-Smtp-Source: AGHT+IEHyKJiarzqZbT6Jlx8LoLMCgKFUq9SysPXMLOAh8UnpD4dLPkM0uDHd0fLaLzI4KXr6ykujw==
X-Received: by 2002:a05:6870:3924:b0:25e:1610:9705 with SMTP id
 586e51a60fabf-26c62c4296emr3318640fac.2.1723241847267; 
 Fri, 09 Aug 2024 15:17:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e589e8e7sm237580b3a.45.2024.08.09.15.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 15:17:26 -0700 (PDT)
Message-ID: <2c4a42ee-164b-447f-b51d-07b2585345b3@broadcom.com>
Date: Fri, 9 Aug 2024 15:17:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-4-jitendra.vegiraju@broadcom.com>
 <c2e2f11a-89d8-42fa-a655-972a4ab372da@lunn.ch>
 <CAMdnO-JBznFpExduwCAm929N73Z_p4S4_nzRaowL9SzseqC6LA@mail.gmail.com>
 <de5b4d42-c81d-4687-b244-073142e2967b@lunn.ch>
 <CAMdnO-+_2Fy=uNgGevtnL8PGPvKyWXPvYaxOJwKcUZj+nnfqYg@mail.gmail.com>
 <5ff4a297-bafd-4b33-aae1-5a983f49119a@lunn.ch>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <5ff4a297-bafd-4b33-aae1-5a983f49119a@lunn.ch>
Cc: hawk@kernel.org, daniel@iogearbox.net, linux@armlinux.org.uk,
 netdev@vger.kernel.org, richardcochran@gmail.com, john.fastabend@gmail.com,
 ast@kernel.org, linux-stm32@st-md-mailman.stormreply.com, horms@kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, bpf@vger.kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Add PCI
 driver support for BCM8958x
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

T24gOC85LzI0IDEzOjEyLCBBbmRyZXcgTHVubiB3cm90ZToKPiBPbiBUaHUsIEF1ZyAwOCwgMjAy
NCBhdCAwNjo1NDo1MVBNIC0wNzAwLCBKaXRlbmRyYSBWZWdpcmFqdSB3cm90ZToKPj4gT24gVHVl
LCBBdWcgNiwgMjAyNCBhdCA0OjE14oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPiB3
cm90ZToKPj4+Cj4+PiBPbiBNb24sIEF1ZyAwNSwgMjAyNCBhdCAwNTo1Njo0M1BNIC0wNzAwLCBK
aXRlbmRyYSBWZWdpcmFqdSB3cm90ZToKPj4+PiBPbiBGcmksIEF1ZyAyLCAyMDI0IGF0IDQ6MDji
gK9QTSBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+IHdyb3RlOgo+Pj4+Pgo+Pj4+Pj4gTWFu
YWdlbWVudCBvZiBpbnRlZ3JhdGVkIGV0aGVybmV0IHN3aXRjaCBvbiB0aGlzIFNvQyBpcyBub3Qg
aGFuZGxlZCBieQo+Pj4+Pj4gdGhlIFBDSWUgaW50ZXJmYWNlLgo+Pj4+Pgo+Pj4+PiBNRElPPyBT
UEk/IEkyQz8KPj4+Pj4KPj4+PiBUaGUgZGV2aWNlIHVzZXMgU1BJIGludGVyZmFjZS4gVGhlIHN3
aXRjaCBoYXMgaW50ZXJuYWwgQVJNIE03IGZvcgo+Pj4+IGNvbnRyb2xsZXIgZmlybXdhcmUuCj4+
Pgo+Pj4gV2lsbCB0aGVyZSBiZSBhIERTQSBkcml2ZXIgc29tZXRpbWUgc29vbiB0YWxraW5nIG92
ZXIgU1BJIHRvIHRoZQo+Pj4gZmlybXdhcmU/Cj4+Pgo+PiBIaSBBbmRyZXcsCj4gCj4gU28gdGhl
IHN3aXRjaCB3aWxsIGJlIGxlZnQgaW4gZHVtYiBzd2l0Y2ggZXZlcnl0aGluZyB0byBldmVyeSBw
b3J0Cj4gbW9kZT8gT3IgaXQgd2lsbCBiZSB0b3RhbGx5IGF1dG9ub21vdXMgdXNpbmcgdGhlIGlu
IGJ1aWxkIGZpcm13YXJlPwo+IAo+IFdoYXQgeW91IGNhbm5vdCBleHBlY3QgaXMgd2UgYWxsb3cg
eW91IHRvIG1hbmFnZSB0aGUgc3dpdGNoIGZyb20gTGludXgKPiB1c2luZyBzb21ldGhpbmcgb3Ro
ZXIgdGhhbiBhbiBpbiBrZXJuZWwgZHJpdmVyLCBwcm9iYWJseSBEU0Egb3IgcHVyZQo+IHN3aXRj
aGRldi4KClRoaXMgbG9va3MgcmVhc29uYWJsZSBhcyBhbiBhZHZpY2UgYWJvdXQgdG8gaWRlYWxs
eSBmaXQgd2l0aGluIHRoZSAKZXhpc3RpbmcgTGludXggc3Vic3lzdGVtcywgaG93ZXZlciB0aGF0
IGlzIHB1cmVseSBpbmZvcm1hdGlvbmFsIGFuZCBpdCAKc2hvdWxkIG5vdCBpbXBhaXIgdGhlIHJl
dmlldyBhbmQgYWNjZXB0YW5jZSBvZiB0aGUgc3RtbWFjIGRyaXZlcnMuCgpEb2luZyBvdGhlcndp
c2UsIGFuZCByZWplY3RpbmcgdGhlIHN0bW1hYyBjaGFuZ2VzIGJlY2F1c2Ugbm93IHlvdSBhbmQg
Cm90aGVyIHJldmlld2Vycy9tYWludGFpbmVycyBrbm93IGhvdyBpdCBnZXRzIHVzZWQgaW4gdGhl
IGJpZ2dlciBwaWN0dXJlIAptZWFucyB0aGlzIGlzIHN0YXJ0aW5nIHRvIGJlIG92ZXJyZWFjaGlu
Zy4gWWVzIHNpbGljb24gdmVuZG9yIGNvbXBhbmllcyAKbGlrZSB0byBkbyBhbGwgc29ydHMgb2Yg
cHJvcHJpZXRhcnkgdGhpbmdzIGZvciByYW5kb20gcmVhc29ucywgSSB0aGluayAKd2UgaGF2ZSB3
b3JrZWQgdG9nZXRoZXIgbG9uZyBlbm91Z2ggb24gRFNBIHRoYXQgeW91IGtub3cgbXkgYmVsaWVm
cyBvbiAKdGhhdCBhc3BlY3QuCgpJIHRoaW5rIHRoZSBzdG1tYWMgY2hhbmdlcyBhbG9uZyBoYXZl
IHRoZWlyIG93biBtZXJpdCwgYW5kIEkgd291bGQgCnNlcmlvdXNseSBsaWtlIHRvIHNlZSBhIHBy
b3BlciBEU0Egb3Igc3dpdGNoZGV2IGRyaXZlciBmb3IgdGhlIHN3aXRjaGluZyAKc2lsaWNvbiB0
aGF0IGlzIGJlaW5nIHVzZWQsIGJ1dCBJIGRvbid0IHRoaW5rIHdlIG5lZWQgdG8gdHJlYXQgdGhl
IApsYXR0ZXIgYXMgYSBwcmVyZXF1aXNpdGUgZm9yIG1lcmdpbmcgdGhlIGZvcm1lci4KClRoYW5r
cyEKLS0gCkZsb3JpYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
