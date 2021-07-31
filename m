Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C50743DD33A
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:44:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87D77C5A4D3;
	Mon,  2 Aug 2021 09:44:55 +0000 (UTC)
Received: from qq.com (unknown [183.3.255.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42C58C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jul 2021 03:52:37 +0000 (UTC)
X-QQ-mid: bizesmtp32t1627703533tx9re992
Received: from [192.168.1.4] (unknown [117.152.154.62])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sat, 31 Jul 2021 11:52:03 +0800 (CST)
X-QQ-SSF: 0040000000200050B000B00A0000000
X-QQ-FEAT: yvN+3SpHa6iqnn+eF8/5mxvZMfB9lihrb0bsJJgmT6aioauBlWvsv79OlT/Jk
 vgMmjfNpkLUZTC14WTqXsX3gAFloUkTF2DrC17Y2f94cuRuTBCKAL7l6EUU3BSYXZL4i8HP
 J6FlCPUL7KsIEFUJiCXNJL0TMjr6EUttlGarxO6o620n4AtVUDoKpJyljHbhQqlOSPo3jXQ
 sMyiil+ILLM81mvdtRIwyScQDex/yusM5t5f4bumDMRRNraNgQ+zpUatHDQtM0r6774LT+0
 gZJoea0qvF3SHRDJQznzI8vwy6HjBR7d+mh5WCltFTCgOPZRq4Op5CJjhQGIzy2yzjMc+4Z
 fSNMDIj7YdASxaCfupxAZ9vbAPv/4QJ1ViJLmGtuKJ2LkafC/c=
X-QQ-GoodBg: 2
To: Jakub Kicinski <kuba@kernel.org>
References: <20210722015433.8563-1-chenhaoa@uniontech.com>
 <6015f3a3-1e6e-5242-bc2b-32d3b077d0e8@uniontech.com>
 <20210730042331.03fafba1@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Hao Chen <chenhaoa@uniontech.com>
Message-ID: <6596f688-cc87-cf6b-5474-842811ad897f@uniontech.com>+DC3D9FFE1B7A930C
Date: Sat, 31 Jul 2021 11:52:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210730042331.03fafba1@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Mon, 02 Aug 2021 09:44:20 +0000
Cc: qiangqing.zhang@nxp.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, davem@davemloft.net, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [net,
	v7] net: stmmac: fix 'ethtool -P' return -EBUSY
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CtTaIDIwMjEvNy8zMCDPws7nNzoyMywgSmFrdWIgS2ljaW5za2kg0LS1wDoKPiBPbiBGcmksIDMw
IEp1bCAyMDIxIDE3OjQ5OjMxICswODAwIEhhbyBDaGVuIHdyb3RlOgo+PiBUaGVyZSB3YXMgbm8g
ZW1haWwgb3IgcmVwbHkgZm9yIGEgd2Vlay4gQ2FuIHRoaXMgcGF0Y2ggYmUgYWNjZXB0ZWQ/Cj4g
TG9va3MgbGlrZSB2NyBkaWRuJ3QgbWFrZSBpdCBpbnRvIHBhdGNod29yaywgdGhlc2UgYXJlIHlv
dXIgc3VibWlzc2lvbnMKPiB3aGljaCBkaWQgcmVnaXN0ZXI6Cj4KPiBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3QvbmV0ZGV2YnBmL2xpc3QvP3N1Ym1pdHRlcj0xOTc4NzEmc3Rh
dGU9Kgo+Cj4gUGxlYXNlIHJlc2VuZC4KPgpJIHJlc2VuZCB0aGUgZW1haWwgYWdhaW4sIGJ1dCB0
aGUgbWFpbGJveCBzZXJ2ZXIgbmV0ZGV2QHZnZXIua2VybmVsLm9yZyAKcmV0dXJuZWQgbXkgbWFp
bC4KCkl0IHNob3c6ICJlcnJvciBjb2RlOmhvc3Qgdmdlci5rZXJuZWwub3JnWzIzLjEyOC45Ni4x
OF0gc2FpZDogNTUzIDUuNy4xIApIZWxsbyBbMTgzLjMuMjI2LjE4Nl0sCgpmb3IgTUFJTCBGUk9N
IGFkZHJlc3MgYWNjZXNzIGlzIGRlbmllZCBieSB0aGUgcG9saWN5IGFuYWx5c2lzIGZ1bmN0aW9u
cy4gCihpbiByZXBseSB0byBNQUlMIEZST00gY29tbWFuZCkiCkhhdmUgSSBiZWVuIGJsYWNrbGlz
dGVko79JIGNhbiBzZWUgdGhlIHJlc2VudCBtYWlsIGF0OgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvcGF0Y2h3b3JrL3Byb2plY3QvbGttbC9saXN0Lz9zZXJpZXM9JnN1Ym1pdHRlcj0zMDEwNCZz
dGF0ZT0qJnE9JmFyY2hpdmU9JmRlbGVnYXRlPSAKPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Bh
dGNod29yay9wcm9qZWN0L2xrbWwvbGlzdC8/c2VyaWVzPSZzdWJtaXR0ZXI9MzAxMDQmc3RhdGU9
KiZxPSZhcmNoaXZlPSZkZWxlZ2F0ZT0+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
