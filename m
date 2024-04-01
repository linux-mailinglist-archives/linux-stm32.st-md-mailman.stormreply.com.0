Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3954989407F
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Apr 2024 18:30:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00B8CC6B47A;
	Mon,  1 Apr 2024 16:30:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2254FC6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Apr 2024 16:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711989046; x=1743525046;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=X6o+CiRuRbPSoFA1uNV4CraaV9Ro04bAs5btj8iowP0=;
 b=fldC04eF+7QwaiTDUeHTA4MiEuHBmtHeuLOrPVccXP+3gnlEdNHwkAmm
 fT2aRCjd7ihHmFXgezckpNUB6nH1b++wh6uaVO4ODCrjswQaqBJ3nYoWE
 ZtTiXMgUGrgveZl7Kk2Feup2NNHkIzCQ8ystZ7jKnAWvMZDTsIBU00M/y
 KfUU6myRnlKwo0D/30dEGScoI/UqNxZiM6cnk8IoNBsBug6J1PZvhm3u9
 vz0eMlaWchd4MX/GCcxIlQDWZRD1RjKKZJ7RnzTL/kMA0bYH+5Zb+Pbbe
 OMl5KWCieZiZXHwxxi+Tc5Qb/b1DHQX4ptLeFCvRQGCQPbRJIqZu1nflm A==;
X-CSE-ConnectionGUID: 3XMpiU09RJCNcPIra7SbhQ==
X-CSE-MsgGUID: sAv1YopxRt6kQ6XmgoPjoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10083748"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="10083748"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="18224587"
Received: from anahar-mobl.amr.corp.intel.com (HELO [10.212.2.239])
 ([10.212.2.239])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:30:43 -0700
Message-ID: <1a42ebbb-1e1f-4ecf-a1ec-7af292f7ff96@linux.intel.com>
Date: Mon, 1 Apr 2024 11:22:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org,
 imx@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87msqdudn7.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87msqdudn7.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [Linux-stm32] [PATCH v2 09/16] ASoC: soc-core: Replace
 dpcm_playback/capture to playback/capture_only
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

CgpPbiAzLzMxLzI0IDE5OjMxLCBLdW5pbm9yaSBNb3JpbW90byB3cm90ZToKPiBzb2NfZ2V0X3Bs
YXliYWNrX2NhcHR1cmUoKSBpcyBub3cgaGFuZGxpbmcgRFBDTSBhbmQgbm9ybWFsIGNvbXByZWhl
bnNpdmVseQo+IGZvciBwbGF5YmFjay9jYXB0dXJlIHN0cmVhbS4gV2UgY2FuIHVzZSBwbGF5YmFj
ay9jYXB0dXJlX29ubHkgZmxhZwo+IGluc3RlYWQgb2YgdXNpbmcgZHBjbV9wbGF5YmFjay9jYXB0
dXJlLiBUaGlzIHBhdGNoIHJlcGxhY2UgdGhlc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogS3VuaW5v
cmkgTW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgo+IFJldmlld2Vk
LWJ5OiBBbWFkZXVzeiBTxYJhd2nFhHNraSA8YW1hZGV1c3p4LnNsYXdpbnNraUBsaW51eC5pbnRl
bC5jb20+Cj4gLS0tCj4gIHNvdW5kL3NvYy9zb2MtY29yZS5jIHwgMjAgKy0tLS0tLS0tLS0tLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxOSBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvYy1jb3JlLmMgYi9zb3VuZC9zb2Mvc29jLWNv
cmUuYwo+IGluZGV4IDNhYjY2MjZhZDY4MC4uYjE2OGNmNjQyMDkyIDEwMDY0NAo+IC0tLSBhL3Nv
dW5kL3NvYy9zb2MtY29yZS5jCj4gKysrIGIvc291bmQvc29jL3NvYy1jb3JlLmMKPiBAQCAtMjAw
MCwyNSArMjAwMCw3IEBAIHN0YXRpYyB2b2lkIHNvY19jaGVja190cGxnX2ZlcyhzdHJ1Y3Qgc25k
X3NvY19jYXJkICpjYXJkKQo+ICAJCQkJZGFpX2xpbmstPnBsYXRmb3Jtcy0+bmFtZSA9IGNvbXBv
bmVudC0+bmFtZTsKPiAgCj4gIAkJCS8qIGNvbnZlcnQgbm9uIEJFIGludG8gQkUgKi8KPiAtCQkJ
aWYgKCFkYWlfbGluay0+bm9fcGNtKSB7Cj4gLQkJCQlkYWlfbGluay0+bm9fcGNtID0gMTsKPiAt
Cj4gLQkJCQlpZiAoZGFpX2xpbmstPmRwY21fcGxheWJhY2spCj4gLQkJCQkJZGV2X3dhcm4oY2Fy
ZC0+ZGV2LAo+IC0JCQkJCQkgImludmFsaWQgY29uZmlndXJhdGlvbiwgZGFpbGluayAlcyBoYXMg
ZmxhZ3Mgbm9fcGNtPTAgYW5kIGRwY21fcGxheWJhY2s9MVxuIiwKPiAtCQkJCQkJIGRhaV9saW5r
LT5uYW1lKTsKPiAtCQkJCWlmIChkYWlfbGluay0+ZHBjbV9jYXB0dXJlKQo+IC0JCQkJCWRldl93
YXJuKGNhcmQtPmRldiwKPiAtCQkJCQkJICJpbnZhbGlkIGNvbmZpZ3VyYXRpb24sIGRhaWxpbmsg
JXMgaGFzIGZsYWdzIG5vX3BjbT0wIGFuZCBkcGNtX2NhcHR1cmU9MVxuIiwKPiAtCQkJCQkJIGRh
aV9saW5rLT5uYW1lKTsKPiAtCj4gLQkJCQkvKiBjb252ZXJ0IG5vcm1hbCBsaW5rIGludG8gRFBD
TSBvbmUgKi8KPiAtCQkJCWlmICghKGRhaV9saW5rLT5kcGNtX3BsYXliYWNrIHx8Cj4gLQkJCQkg
ICAgICBkYWlfbGluay0+ZHBjbV9jYXB0dXJlKSkgewo+IC0JCQkJCWRhaV9saW5rLT5kcGNtX3Bs
YXliYWNrID0gIWRhaV9saW5rLT5jYXB0dXJlX29ubHk7Cj4gLQkJCQkJZGFpX2xpbmstPmRwY21f
Y2FwdHVyZSA9ICFkYWlfbGluay0+cGxheWJhY2tfb25seTsKPiAtCQkJCX0KPiAtCQkJfQo+ICsJ
CQlkYWlfbGluay0+bm9fcGNtID0gMTsKPiAgCj4gIAkJCS8qCj4gIAkJCSAqIG92ZXJyaWRlIGFu
eSBCRSBmaXh1cHMKCk5vdCBmb2xsb3dpbmcgdGhpcyBsYXN0IGNoYW5nZSBlaXRoZXIsIHRoZSBj
b2RlIHVzZWQgdG8gYmUgY29uZGl0aW9uYWwKCiAgICAgICAgICAgICAgICAgICAgICAgIC8qIGNv
bnZlcnQgbm9uIEJFIGludG8gQkUgKi8KCQkJaWYgKCFkYWlfbGluay0+bm9fcGNtKSB7CgkJCQlk
YWlfbGluay0+bm9fcGNtID0gMTsKCmFuZCBub3QgaXQncyB1bmNvbmRpdGlvbmFsCgogICAgICAg
ICAgICAgICAgICAgICAgICBkYWlfbGluay0+bm9fcGNtID0gMTsKCkl0J3Mgbm90IGNsZWFyIHRv
IG1lIGhvdyB0aGlzIGlzIHJlbGF0ZWQgdG8gdGhlCmRwY21fcGxheWJhY2svZHBjbV9jYXB0dXJl
IHJlbW92YWwuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
