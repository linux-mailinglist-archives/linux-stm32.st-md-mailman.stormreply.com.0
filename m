Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D4888DFD8
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Mar 2024 13:27:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01D4AC71281;
	Wed, 27 Mar 2024 12:27:22 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AACD1C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 15:13:46 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-33ed5b6bf59so4038234f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 08:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711466026; x=1712070826;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8K91MeUI92QSNqtrLE2UhY+c3/vxq+M1n6BAajR3fU8=;
 b=Icr5KL9IDpPOKHog7BzeSv89OmeCskQjhNB1ZNtuOkye3b3Lqb0zF1YGFjeQmpnrYF
 tQyO5W4H6Buin3ZR2wK2oU7usYYDqRLt4bnecI1wcbU/lN6nP5gbbaxEo1QnjxvEcugf
 8ziJykWVmCpJHjs/oBbg5hiunr+1D9L2+dUKF8lrb8CsF9NM6UZ+cAA/X+5Skgz0ugWv
 L81Xdjvjg8ahU/EcComDKKufNNX/VbNNACCAb+yT7YaU1Nn5uWPpXq/XUfMsQF9o7lt2
 NwVg0uwJZKgW/sgZP6GykX4NX+gxUJv6Pj96BjzK2G/G7lPTMDr+WF40tixkrqMQS4fE
 gabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711466026; x=1712070826;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8K91MeUI92QSNqtrLE2UhY+c3/vxq+M1n6BAajR3fU8=;
 b=TKkDhsdlvMrhabofSCvSFxnDvV5WUPpaWwqhR4lw98VMATPvJyxuEn824pqemjF9Q9
 Oa6RhV80w2B2pJrte63S9vlO8ZAHHznakyk8EYMyEfAcfN32aB0egoYpXp9Alhg+4AZS
 6hvhAULDJ7tnPKH9hELkhI8/nTYreAAXcM0bWyJ9JYKm6qgdMcG1xDgfv51A/FS6f3oB
 CxSun4f076awGQhS44ppQ5IWrSEZE/PeyMqWe2YjxkzDhFZWP2PyJMAw22REsu5Bu6sC
 Z4eR5K9NcdHziEZ9dhV8Kv0K66iWm7wLNrA1Hf5/6s5XiYynMrLGqaaxrosjJ/HzC24c
 DcAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAlFg3TJf5pPU+hzx9+DyVphoA+loG63SMJIaeI7hbvQBVWGYcwugWO0GpwoB0O7KkX4CT+kWrkQzb+iBRCeP83r/Hm8TCAhJlZZNiMGALwYflnefIESzH
X-Gm-Message-State: AOJu0YxmBWnEuNoNIeBQYO18GBGdxNSzToq+W24A66nYeHazvpcxXUK1
 2P+KthxjNxillvvSdWChAw5wbktUO923hmiioySg+bGIcKNzKD9C13R0vbTzCZw=
X-Google-Smtp-Source: AGHT+IG7juK6Fs9BqzuZzCmGJd8YvjlgEl/Mjp8jyHt2HJpd+O8407YSUES9NqM6v17Ag53YwrSUMg==
X-Received: by 2002:a5d:6d09:0:b0:33e:bdea:629e with SMTP id
 e9-20020a5d6d09000000b0033ebdea629emr1525056wrq.37.1711466025887; 
 Tue, 26 Mar 2024 08:13:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:97a2:bb9f:463a:6468])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a056000174a00b0033ec9ddc638sm12480834wrf.31.2024.03.26.08.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 08:13:45 -0700 (PDT)
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
 <8734sf53kv.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 26 Mar 2024 15:58:06 +0100
In-reply-to: <8734sf53kv.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1j7chp9gbb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Mar 2024 12:27:20 +0000
Cc: imx@lists.linux.dev, Cezary Rojewski <cezary.rojewski@intel.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Maso Huang <maso.huang@mediatek.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?utf-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 linux-sound@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Brent Lu <brent.lu@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Kevin Hilman <khilman@baylibre.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 15/15] ASoC: soc-pcm: indicate warning if
 DPCM BE Codec has no settings
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

Ck9uIE1vbiAyNSBNYXIgMjAyNCBhdCAwNDozNywgS3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlub3Jp
Lm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPiB3cm90ZToKCj4gSGlzdG9yaWNhbGx5LCBBU29DIGRv
ZXNuJ3QgaGF2ZSB2YWxpZGF0aW9uIGNoZWNrIGZvciBEUENNIEJFIENvZGVjLAo+IGJ1dCBpdCBz
aG91bGQgaGF2ZS4gQ3VycmVudCBBU29DIGlzIGlnbm9yaW5nIGl0IHNhbWUgYXMgYmVmb3JlLAo+
IGJ1dCBsZXQncyBpbmRpY2F0ZSB0aGUgd2FybmluZyBhYm91dCB0aGF0Lgo+Cj4gVGhpcyB3YXJu
aW5nIGFuZCBjb2RlIHNob3VsZCBiZSByZW1vdmVkIGFuZCBjbGVhbnVwZWQgaWYgRFBDTSBCRSBD
b2RlYwo+IGhhcyBuZWNlc3Nhcnkgc2V0dGluZ3MuCgpIZWxsbyBLdW5pbm9yaS1zYW4sCgpJJ20g
bm90IHF1aXRlIHN1cmUgd2hhdCB5b3UgbWVhbiBieSAic2hvdWxkIGhhdmUgdmFsaWRhdGlvbiIg
YW5kIHdoYXQKc2V0dGluZyBleGFjdGx5IHdlIHNob3VsZCB2YWxpZGF0ZSA/CgpJIGtub3cgSSBz
aG91bGQgYmUgYWJsZSB0byBhYmxlIHRvIHVuZGVyc3RhbmQgdGhhdApmcm9tIHRoZSBjb2RlIGJl
bG93IGJ1dCwgc29tZWhvdyBJIGhhdmUgdHJvdWJsZSBkZWNpcGhlcmluZyBpdC4KCkNvdWxkIHlv
dSBleHBsYWluIGl0IGEgYml0IG1vcmUgPwoKSSB3b25kZXIgaWYgdGhpcyBnb2luZyB0byB0cmlw
IG92ZXIgdGhlIHNhbWUgY29ybmVyIGNhc2UgYXMgbGFzdCB0aW1lOgoKV2hlcmUgeW91IGhhdmUg
YSBDUFUgc3VwcG9ydGluZyBib3RoIGRpcmVjdGlvbiBhbmQgMiBjb2RlY3MsIGVhY2gKc3VwcG9y
dGluZyAxIHN0cmVhbSBkaXJlY3Rpb24gPyBUaGlzIGlzIGEgdmFsaWQgaTJzIGNvbmZpZ3VyYXRp
b24uCgpNYXliZSBJJ20gbm90IHVuZGVyc3RhbmRpbmcgdGhlIHBhdGNoc2V0IGNvcnJlY3RseS4K
Cj4gT25lIG9mIHRoZSBiaWcgdXNlciB3aGljaCBkb2Vzbid0IGhhdmUgaXQgaXMgSW50ZWwuCj4K
PiAJLS0tIHNvdW5kL3NvYy9jb2RlY3MvaGRhLmMgLS0tCj4KPiAJc3RhdGljIHN0cnVjdCBzbmRf
c29jX2RhaV9kcml2ZXIgY2FyZF9iaW5kZXJfZGFpID0gewo+IAkJLmlkID0gLTEsCj4gCQkubmFt
ZSA9ICJjb2RlYy1wcm9iaW5nLURBSSIsCj4gKwkJLmNhcHR1cmUuY2hhbm5lbHNfbWluID0gMSwK
PiArCQkucGxheWJhY2suY2hhbm5lbHNfbWluID0gMSwKPiAJfTsKPgo+IAktLS0gc291bmQvcGNp
L2hkYS9wYXRjaF9oZG1pLmMgLS0tCj4KPiAJc3RhdGljIGludCBnZW5lcmljX2hkbWlfYnVpbGRf
cGNtcyguLi4pCj4gCXsKPiAJCS4uLgo+IAkJZm9yICguLi4pIHsKPiAJCQkuLi4KPiArCQkJcHN0
ci0+Y2hhbm5lbHNfbWluID0gMTsKPiAJCX0KPgo+IAkJcmV0dXJuIDA7Cj4gCX0KPgo+IExpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvYWIzZjBjMGEtNjJmZC1hNDY4LWIzY2YtMGU0YjU5
YmFjNmFlQGxpbnV4LmludGVsLmNvbQo+IENjOiBBbWFkZXVzeiBTxYJhd2nFhHNraSA8YW1hZGV1
c3p4LnNsYXdpbnNraUBsaW51eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogS3VuaW5vcmkg
TW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgo+IC0tLQo+ICBzb3Vu
ZC9zb2Mvc29jLXBjbS5jIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2MtcGNtLmMgYi9zb3VuZC9zb2Mvc29jLXBjbS5jCj4gaW5k
ZXggYWM0MmMwODk4MTViLi45YTU0ZDVkNDliNjUgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29jL3Nv
Yy1wY20uYwo+ICsrKyBiL3NvdW5kL3NvYy9zb2MtcGNtLmMKPiBAQCAtMjc5Niw3ICsyNzk2LDYg
QEAgc3RhdGljIGludCBzb2NfZ2V0X3BsYXliYWNrX2NhcHR1cmUoc3RydWN0IHNuZF9zb2NfcGNt
X3J1bnRpbWUgKnJ0ZCwKPiAgCXN0cnVjdCBzbmRfc29jX2RhaV9saW5rX2NoX21hcCAqY2hfbWFw
czsKPiAgCXN0cnVjdCBzbmRfc29jX2RhaSAqY3B1X2RhaTsKPiAgCXN0cnVjdCBzbmRfc29jX2Rh
aSAqY29kZWNfZGFpOwo+IC0Jc3RydWN0IHNuZF9zb2NfZGFpICpkdW1teV9kYWkgPSBzbmRfc29j
X2ZpbmRfZGFpKCZzbmRfc29jX2R1bW15X2RsYyk7Cj4gIAlpbnQgY3B1X3BsYXliYWNrOwo+ICAJ
aW50IGNwdV9jYXB0dXJlOwo+ICAJaW50IGhhc19wbGF5YmFjayA9IDA7Cj4gQEAgLTI4MTcsMjQg
KzI4MTYsMzcgQEAgc3RhdGljIGludCBzb2NfZ2V0X3BsYXliYWNrX2NhcHR1cmUoc3RydWN0IHNu
ZF9zb2NfcGNtX3J1bnRpbWUgKnJ0ZCwKPiAgCSAqCXNvYy5oIDo6IFtkYWlfbGluay0+Y2hfbWFw
cyBJbWFnZSBzYW1wbGVdCj4gIAkgKi8KPiAgCWZvcl9lYWNoX3J0ZF9jaF9tYXBzKHJ0ZCwgaSwg
Y2hfbWFwcykgewo+IC0JCWNwdV9kYWkJICA9IHNuZF9zb2NfcnRkX3RvX2NwdShydGQsICAgY2hf
bWFwcy0+Y3B1KTsKPiAtCQljb2RlY19kYWkgPSBzbmRfc29jX3J0ZF90b19jb2RlYyhydGQsIGNo
X21hcHMtPmNvZGVjKTsKPiArCQlpbnQgY3B1X3BsYXlfdCwgY3B1X2NhcHR1cmVfdDsKPiArCQlp
bnQgY29kZWNfcGxheV90LCBjb2RlY19jYXB0dXJlX3Q7Cj4gKwo+ICsJCWNwdV9kYWkJCT0gc25k
X3NvY19ydGRfdG9fY3B1KHJ0ZCwgICBjaF9tYXBzLT5jcHUpOwo+ICsJCWNvZGVjX2RhaQk9IHNu
ZF9zb2NfcnRkX3RvX2NvZGVjKHJ0ZCwgY2hfbWFwcy0+Y29kZWMpOwo+ICsKPiArCQljcHVfcGxh
eV90CT0gc25kX3NvY19kYWlfc3RyZWFtX3ZhbGlkKGNwdV9kYWksICAgY3B1X3BsYXliYWNrKTsK
PiArCQljb2RlY19wbGF5X3QJPSBzbmRfc29jX2RhaV9zdHJlYW1fdmFsaWQoY29kZWNfZGFpLCBT
TkRSVl9QQ01fU1RSRUFNX1BMQVlCQUNLKTsKPiArCj4gKwkJY3B1X2NhcHR1cmVfdAk9IHNuZF9z
b2NfZGFpX3N0cmVhbV92YWxpZChjcHVfZGFpLCAgIGNwdV9jYXB0dXJlKTsKPiArCQljb2RlY19j
YXB0dXJlX3QJPSBzbmRfc29jX2RhaV9zdHJlYW1fdmFsaWQoY29kZWNfZGFpLCBTTkRSVl9QQ01f
U1RSRUFNX0NBUFRVUkUpOwo+ICAKPiAgCQkvKgo+IC0JCSAqIEZJWE1FCj4gKwkJICogRklYTUUg
LyBDTEVBTi1VUC1NRQo+ICAJCSAqCj4gIAkJICogRFBDTSBCRSBDb2RlYyBoYXMgYmVlbiBubyBj
aGVja2VkIGJlZm9yZS4KPiAgCQkgKiBJdCBzaG91bGQgYmUgY2hlY2tlZCwgYnV0IGl0IGJyZWFr
cyBjb21wYXRpYmlsaXR5Lgo+ICAJCSAqIEl0IGlnbm9yZXMgQkUgQ29kZWMgaGVyZSwgc28gZmFy
Lgo+ICAJCSAqLwo+IC0JCWlmIChkYWlfbGluay0+bm9fcGNtKQo+IC0JCQljb2RlY19kYWkgPSBk
dW1teV9kYWk7Cj4gKwkJaWYgKChkYWlfbGluay0+bm9fcGNtKSAmJgo+ICsJCSAgICAoKGNwdV9w
bGF5X3QJJiYgIWNvZGVjX3BsYXlfdCkgfHwKPiArCQkgICAgIChjcHVfY2FwdHVyZV90CSYmICFj
b2RlY19jYXB0dXJlX3QpKSkgewo+ICsJCQlkZXZfd2Fybl9vbmNlKHJ0ZC0+ZGV2LCAiRENQTSBC
RSBDb2RlYyBoYXMgbm8gc3RyZWFtIHNldHRpbmdzICglcylcbiIsCj4gKwkJCQkgICAgICBjb2Rl
Y19kYWktPm5hbWUpOwoKVGFraW5nIG9uZSBjb2RlYyBhdCBhIHRpbWUsIHdvdWxkIHlvdSB0cmln
Z2VyIGEgd2FybmluZyBmb3IgdGhlIHVzZSBjYXNlIEkKZGVzY3JpYmVkIGFib3ZlID8KCj4gKwkJ
CWNvZGVjX3BsYXlfdAk9IDE7Cj4gKwkJCWNvZGVjX2NhcHR1cmVfdAk9IDE7Cj4gKwkJfQo+ICAK
PiAtCQlpZiAoc25kX3NvY19kYWlfc3RyZWFtX3ZhbGlkKGNwdV9kYWksICAgY3B1X3BsYXliYWNr
KSAmJgo+IC0JCSAgICBzbmRfc29jX2RhaV9zdHJlYW1fdmFsaWQoY29kZWNfZGFpLCBTTkRSVl9Q
Q01fU1RSRUFNX1BMQVlCQUNLKSkKPiArCQlpZiAoY3B1X3BsYXlfdCAmJiBjb2RlY19wbGF5X3Qp
Cj4gIAkJCWhhc19wbGF5YmFjayA9IDE7Cj4gLQkJaWYgKHNuZF9zb2NfZGFpX3N0cmVhbV92YWxp
ZChjcHVfZGFpLCAgIGNwdV9jYXB0dXJlKSAmJgo+IC0JCSAgICBzbmRfc29jX2RhaV9zdHJlYW1f
dmFsaWQoY29kZWNfZGFpLCBTTkRSVl9QQ01fU1RSRUFNX0NBUFRVUkUpKQo+ICsJCWlmIChjcHVf
Y2FwdHVyZV90ICYmIGNvZGVjX2NhcHR1cmVfdCkKPiAgCQkJaGFzX2NhcHR1cmUgPSAxOwo+ICAJ
fQoKCi0tIApKZXJvbWUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
