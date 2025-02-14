Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B189BA355DB
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 05:50:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CF7FC78F89;
	Fri, 14 Feb 2025 04:50:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DB26C78F7D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 04:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739508624; x=1771044624;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=gPVj4mO6xQJrCt3sZYWJNbH9C8SimtbKXR7wY1fjf90=;
 b=TYZNArpb1xiUSa3uQxRFGAMSM+vHmjx4KjPErgm4UqMpLQ1TO9CITvHy
 zOZPmKjz93oJdWxdizJZI2sWeHHPKcS95GqhK1t1HbHk1h/+GgLF1x6Iv
 RcL8yP8PYLauJW7Qvw0UK2Ez507olDIE64pLvEyFiBUg4ID8qsQPJNP2f
 DqMDxBw4IONdMwPcOohSi/KT6VZgrNtgix0UDVj0dTiQQPtKdSncoVvRW
 lkFnLi8ZQx/bYBtymU0E0D6uRlmaWiOeuV2+NJ49qNYoo+W7EFcGbpj+R
 xSz4Q2oPdk2o98U6oRT7C5VPEmvVLVaxYyEXnXJz06G6+Lrw5sfgupy3u g==;
X-CSE-ConnectionGUID: dIXs0SGoRz+UByJwV4AMYg==
X-CSE-MsgGUID: 5e3R67LeQXWIroYjVIDXUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40361838"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40361838"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 20:50:15 -0800
X-CSE-ConnectionGUID: 2b+fgtn9Q7+FDC4KwavSPQ==
X-CSE-MsgGUID: wezvzmt3Tm6HcUS0QIfqlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="113096903"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.123.6])
 ([10.247.123.6])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 20:50:07 -0800
Message-ID: <e5c5d7ed-9f47-4af1-aee4-4632099bd546@linux.intel.com>
Date: Fri, 14 Feb 2025 12:50:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
To: Kurt Kanzenbach <kurt@linutronix.de>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250212220121.ici3qll66pfoov62@skbuf>
 <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
 <87cyfmnjdh.fsf@kurt.kurt.home>
 <5902cc28-a649-4ae9-a5ba-83aa265abaf8@linux.intel.com>
 <20250213130003.nxt2ev47a6ppqzrq@skbuf>
 <1c981aa1-e796-4c53-9853-3eae517f2f6d@linux.intel.com>
 <877c5undbg.fsf@kurt.kurt.home> <20250213184613.cqc2zhj2wkaf5hn7@skbuf>
 <87v7td3bi1.fsf@kurt.kurt.home>
 <b7740709-6b4a-4f44-b4d7-e265bb823aca@linux.intel.com>
Content-Language: en-US
In-Reply-To: <b7740709-6b4a-4f44-b4d7-e265bb823aca@linux.intel.com>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v4 0/9] igc: Add support for
 Frame Preemption feature in IGC
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

CgpPbiAxNC8yLzIwMjUgMTI6MjAgcG0sIEFiZHVsIFJhaGltLCBGYWl6YWwgd3JvdGU6Cj4gCj4g
Cj4gT24gMTQvMi8yMDI1IDM6MTIgYW0sIEt1cnQgS2FuemVuYmFjaCB3cm90ZToKPj4gT24gVGh1
IEZlYiAxMyAyMDI1LCBWbGFkaW1pciBPbHRlYW4gd3JvdGU6Cj4+PiBTbywgY29uZnVzaW5nbHkg
dG8gbWUsIGl0IHNlZW1zIGxpa2Ugb25lIG9wZXJhdGluZyBtb2RlIGlzIGZ1bmRhbWVudGFsbHkK
Pj4+IGRpZmZlcmVudCBmcm9tIHRoZSBvdGhlciwgYW5kIHNvbWV0aGluZyB3aWxsIGhhdmUgdG8g
Y2hhbmdlIGlmIGJvdGggd2lsbAo+Pj4gYmUgbWFkZSB0byBiZWhhdmUgdGhlIHNhbWUuIFdoYXQg
d2lsbCBjaGFuZ2U/IFlvdSBzYXkgbXFwcmlvIHdpbGwgYmVoYXZlCj4+PiBsaWtlIHRhcHJpbywg
YnV0IEkgdGhpbmsgaWYgYW55dGhpbmcsIG1xcHJpbyBpcyB0aGUgb25lIHdoaWNoIGRvZXMgdGhl
Cj4+PiByaWdodCB0aGluZywgaW4gaWdjX3Rzbl90eF9hcmIoKSwgYW5kIHRhcHJpbyBzZWVtcyB0
byB1c2UgdGhlIGRlZmF1bHQgVHgKPj4+IGFyYml0cmF0aW9uIHNjaGVtZT8KPj4KPj4gQ29ycmVj
dC4gdGFwcmlvIGlzIHVzaW5nIHRoZSBkZWZhdWx0IHNjaGVtZS4gbXFwcmlvIGNvbmZpZ3VyZXMg
aXQgdG8KPj4gd2hhdCBldmVyIHRoZSB1c2VyIHByb3ZpZGVkIChpbiBpZ2NfdHNuX3R4X2FyYigp
KS4KPj4KPj4+IEkgZG9uJ3QgdGhpbmsgSSdtIG9uIHRoZSBzYW1lIHBhZ2UgYXMgeW91IGd1eXMs
IGJlY2F1c2UgdG8gbWUsIGl0IGlzCj4+PiBqdXN0IG9kZCB0aGF0IHRoZSBQIHRyYWZmaWMgY2xh
c3NlcyB3b3VsZCBiZSB0aGUgZmlyc3Qgb25lcyB3aXRoCj4+PiBtcXByaW8sIGJ1dCB0aGUgbGFz
dCBvbmVzIHdpdGggdGFwcmlvLgo+Pgo+PiBJIHRoaW5rIHdlIGFyZSBvbiB0aGUgc2FtZSBwYWdl
IGhlcmUuIEF0IHRoZSBlbmQgYm90aCBoYXZlIHRvIGJlaGF2ZSB0aGUKPj4gc2FtZS4gRWl0aGVy
IGJ5IHVzaW5nIGlnY190c25fdHhfYXJiKCkgZm9yIHRhcHJpbyB0b28gb3Igb25seSB1c2luZyB0
aGUKPj4gZGVmYXVsdCBzY2hlbWUgZm9yIGJvdGggKGFuZCB0aGVyZWJ5IGtlZXBpbmcgYnJva2Vu
X21xcHJpbykuIFdoYXRldmVyCj4+IEZhaXphbCBpbXBsZW1lbnRzIEknbGwgbWF0Y2ggdGhlIGJl
aGF2aW9yIHdpdGggbXFwcmlvLgo+Pgo+IAo+IEhpIEt1cnQgJiBWbGFkaW1pciwKPiAKPiBBZnRl
ciByZWFkaW5nIFZsYWRpbWlyJ3MgcmVwbHkgb24gdGMsIGh3IHF1ZXVlLCBhbmQgc29ja2V0IHBy
aW9yaXR5IG1hcHBpbmcgCj4gZm9yIGJvdGggdGFwcmlvIGFuZCBtcXByaW8sIEkgYWdyZWUgdGhl
eSBzaG91bGQgZm9sbG93IHRoZSBzYW1lIHByaW9yaXR5IAo+IHNjaGVtZSBmb3IgY29uc2lzdGVu
Y3nigJRib3RoIGluIGNvZGUgYW5kIGNvbW1hbmQgdXNhZ2UgKGkuZS4sIHRhcHJpbywgCj4gbXFw
cmlvLCBhbmQgZnBlIGluIGJvdGggY29uZmlndXJhdGlvbnMpLiBTaW5jZSBpZ2NfdHNuX3R4X2Fy
YigpIGVuc3VyZXMgYSAKPiBzdGFuZGFyZCBtYXBwaW5nIG9mIHRjLCBzb2NrZXQgcHJpb3JpdHks
IGFuZCBoYXJkd2FyZSBxdWV1ZSBwcmlvcml0eSwgSSdsbCAKPiBlbmFibGUgdGFwcmlvIHRvIHVz
ZSBpZ2NfdHNuX3R4X2FyYigpIGluIGEgc2VwYXJhdGUgcGF0Y2ggc3VibWlzc2lvbi4KPiAKPiBJ
J2xsIHNwbGl0IHRoZSBjaGFuZ2VzIGJhc2VkIG9uIFZsYWRpbWlyJ3Mgc3VnZ2VzdGlvbi4KPiAK
PiBGaXJzdCBwYXJ0IC0gZXRodG9vbC1tbSByZWxhdGVkOgo+IGlnYzogQWRkIHN1cHBvcnQgdG8g
Z2V0IGZyYW1lIHByZWVtcHRpb24gc3RhdGlzdGljcyB2aWEgZXRodG9vbAo+IGlnYzogQWRkIHN1
cHBvcnQgdG8gZ2V0IE1BQyBNZXJnZSBkYXRhIHZpYSBldGh0b29sCj4gaWdjOiBBZGQgc3VwcG9y
dCB0byBzZXQgdHgtbWluLWZyYWctc2l6ZQo+IGlnYzogQWRkIHN1cHBvcnQgZm9yIGZyYW1lIHBy
ZWVtcHRpb24gdmVyaWZpY2F0aW9uCj4gaWdjOiBTZXQgdGhlIFJYIHBhY2tldCBidWZmZXIgc2l6
ZSBmb3IgVFNOIG1vZGUKPiBpZ2M6IE9wdGltaXplIFRYIHBhY2tldCBidWZmZXIgdXRpbGl6YXRp
b24KPiBpZ2M6IFJlbmFtZSB4ZHBfZ2V0X3R4X3JpbmcoKSBmb3Igbm9uLVhEUCB1c2FnZQo+IG5l
dDogZXRodG9vbDogbW06IEV4dHJhY3Qgc3RtbWFjIHZlcmlmaWNhdGlvbiBsb2dpYyBpbnRvIGEg
Y29tbW9uIGxpYnJhcnkKPiAKPiBTZWNvbmQgcGFydDoKPiBpZ2M6IEFkZCBzdXBwb3J0IGZvciBw
cmVlbXB0aWJsZSB0cmFmZmljIGNsYXNzIGluIHRhcHJpbyBhbmQgbXFwcmlvCj4gaWdjOiBVc2Ug
aWdjX3Rzbl90eF9hcmIoKSBmb3IgdGFwcmlvIHF1ZXVlIHByaW9yaXR5IHNjaGVtZQo+IGlnYzog
S3VydCdzIHBhdGNoIG9uIG1xcHJpbyB0byB1c2Ugbm9ybWFsIFRTTiBUeCBtb2RlCj4gCj4gS3Vy
dCBjYW4ga2VlcCBpZ2NfdHNuX3R4X2FyYigpIGZvciBoaXMgbXFwcmlvIHBhdGNoLCBzbyBwcmVl
bXB0aWJsZSB0YyAKPiBzaG91bGQgd29yayB0aGUgc2FtZSBmb3IgYm90aCB0YXByaW8gYW5kIG1x
cHJpby4KPiAKPiBJJ20gc3VnZ2VzdGluZyB0byBpbmNsdWRlIEt1cnQncyBwYXRjaCBpbiB0aGUg
c2Vjb25kIHBhcnQgc2luY2UgdGhlcmUncyAKPiBzb21lIGRlcGVuZGVuY3kgYW5kIHBvdGVudGlh
bCBjb2RlIGNvbmZsaWN0LCBldmVuIHRob3VnaCBpdCBtaXhlcyBkaWZmZXJlbnQgCj4gZnVuY3Rp
b25hbCBjaGFuZ2VzIGluIHRoZSBzYW1lIHNlcmllcy4KCkkgZm9yZ290IHRoYXQgdGhlIHNlY29u
ZCBwYXJ0IHBhdGNoOgppZ2M6IEFkZCBzdXBwb3J0IGZvciBwcmVlbXB0aWJsZSB0cmFmZmljIGNs
YXNzIGluIHRhcHJpbyBhbmQgbXFwcmlvCgpkZXBlbmRzIG9uIHRoZSBmaXJzdCBwYXJ0IGV0aHRv
b2wtbW0sIHdoaWNoIHdvdWxkIGRlbGF5IEt1cnQncyBwYXRjaC4KClNvIEt1cnQsIGlmIHlvdSdk
IHByZWZlciB0byBzdWJtaXQgeW91cnMgZmlyc3QsIHRoYXQncyBva2F5IHRvby4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
