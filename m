Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCfLGFs+wWk9RwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 14:21:31 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4924C2F2C3B
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 14:21:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EBB3C35E3C;
	Mon, 23 Mar 2026 13:21:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30AE0C87EC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 13:21:29 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62NC1whA3041700
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 23 Mar 2026 13:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yle54aasT0KAyqE+c56KG4QyZSQeSkBHtORNvORo1pE=; b=DNyUHVHVyPrHUr38
 Xak8Gq5GJ3zIqN8aI5S8N5ng4jsCxFEFQa+hG7ZyeZjAsKwCD4PMZjatk3vs0iiM
 +qMhA+XP8aDgi1rxxICX2A2N5CsexJj1YEh0US24LYYu8RKuQXybtLbQ4CVbUCUK
 fEwQ0123+8dSSgYwfj8FKP3sFJfC74sCdDhpGDNlWlr3iiRdxksTb3nDHB6VUl4W
 FX7yzZwoeggxFMDFrVwtfNJgTkC4QUSSLO7TtRBQQTs0LmvFAVV/79N8aD6zNPvz
 UB1KL1PvUWfr21GW9AVav7bnkME/0fNYb5xW1HRE+XNjO4PiSYBEryZNdV6OtX63
 d1FzIQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w08af-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 13:21:27 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-94d6c5433a0so563435241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 06:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774272087; x=1774876887;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yle54aasT0KAyqE+c56KG4QyZSQeSkBHtORNvORo1pE=;
 b=hYF4sx0O8gVuqH363S9yzmFZmAcRe8RTCB7PiCGViHP6jF+LUTpq9l8Q7HJP5162//
 qpNbdgnY2FJtZRcWVidM1ahRyPbgIvsfveuc7dcBvtACeBqG56l6Ly7GY0hNRBflb38E
 Ydsp7RNPy5TmvL/baPG+u6TdK0T63KVUSFiY4UeR4o4wQQm9dFsyoCLNKpsQpPU0bCow
 LKyHPuJijvpCC8y2qjTI7AlwIFPN3UP1rW6YZPaEI9Ps6SOIJrCdwTxT4SmSHKwEMaI0
 QhhsWY0OLgyEK4VU5GHMX4PvyTOoCPL7B86LM1UaARSLLTP6yC6htohd3bPFUvFvMD7A
 pY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774272087; x=1774876887;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yle54aasT0KAyqE+c56KG4QyZSQeSkBHtORNvORo1pE=;
 b=e8sms707jrTZS+2QKEV3d6xfDy+hMU2edH+FAD5+g/NmMfwk7D5kdGKq5Ibu2OTFtL
 ZdcsQGlnzHbhR1m50Hdw7jWvYD9TYsoPcdNZnR5aLw+OhTot+lnhRqYEfXi9k21ykd0X
 KBIoMDUSi0nx1c9qlM+y0bNVcX9YySzlttsqKFnrZAcI6ezsJyX/W/6VaSCabnURva7S
 0nvEWq1YOnMDxehULTeRtvTYQjXIXChen1Kh+68DtL0YYPB31t2KWWeUlhhUxP6faCTD
 +AtZFpUxdU4eOnaawOZGzad4JN28RwamtWYPngpji9VT/C64CquQWRfYRJWRPpxMiMH8
 5kMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPM1PHRSzNjvwe8AOD/j3F0/CHm8MDpp8TZ2uJuzDE1gvztXBszDYMz1vxm3KAJSOX6okBxR0tV8x4zQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzoXK+oUr7R3Hw00UoviguJ+yz1pjdCDNTjcMkFAGMDff1MZ5CG
 F7Q48cWBkuF865E3uj9pDBa1RPaUSPx2EU0un5271R9Xhhyce85OxXgRxobn2QmfX/eIXPt2cKo
 +x/iw5ewW6nuO+RGa7fmcE4Z1Av8kZp+9ncDB5LBIcFXfPufELyoafvj+Di2U7aFo7O0M9WT5VU
 V5j1n/TMk=
X-Gm-Gg: ATEYQzwqPJoCBLm54ytKMoIVcHXsO5vHvQJFaEDwhUglomILJw/w44fU0cl52bD1Dbm
 sB17gWOlavTfZ1PlWIYTVyJSr9iPVvI806ULcgTDUS96fHulw1ZBoHBWwragrPzpritEnnezJLS
 stjCjuu0LbkNeG5/n1en04kvfvMhs0/DuFzjwfkOkKoh0MhUYkcmHYrZqDHpxuMHLNHpdkH+wAw
 UVZvXqnTffNjac2w2CgZm4yCDJYGTmvN6EA1EXcMQI0+4pf2RhKV3s/TxxXeo8c2NGL/A87Zmd+
 /PSVMaxidNUA2n6vmPEeIJe/xcgGP26J9gfQCQo7maSl5CZRKxHP0CWMJ4Pll3meds90QsASfgT
 qmDikLOHGwVQ31+yF44Oc0ifBXvErvNh2mlwfGHE7S9DFRz1FzIK7
X-Received: by 2002:a05:6102:304c:b0:5ff:fbe4:8a8 with SMTP id
 ada2fe7eead31-602aed054camr5615937137.25.1774272087247; 
 Mon, 23 Mar 2026 06:21:27 -0700 (PDT)
X-Received: by 2002:a05:6102:304c:b0:5ff:fbe4:8a8 with SMTP id
 ada2fe7eead31-602aed054camr5615916137.25.1774272086743; 
 Mon, 23 Mar 2026 06:21:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 06:21:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:20:54 +0100
MIME-Version: 1.0
Message-Id: <20260323-qcom-sa8255p-emac-v10-2-79302b238a16@oss.qualcomm.com>
References: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zcR0RnjcSI1SgFgu/C5UbX/pxDqfJ6EHZAvAye3xmuI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5HySyt+qzXu07TEj5NXpUEZpB9c2m0vaFfT
 E1nGa2TGUqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+RwAKCRAFnS7L/zaE
 w0wgEACygEU9p++p9rMQwhvugYB8IPaUzeQ7GkVztEIF9mqKAZo0I+UG9krsT5B2LLN1vr1Fd5S
 x35kFvAKbLN2/iPJKOHafYlD1GNfuQbTdSSzHbsh3TmrpCaBg2AK3hSIHCMjgKnfiw78fce6mSj
 6MoQpIT9wWxXKMzk02wwTU5Q9lfJG3f6EP79Srfo7laossl1waDXZ5tLMKVHyLAm5AL3erk27TV
 zwTBzl2tiB2bO4s33mHw+G8d9ygwWUT4xu9ZYTTTMHViiOoy6C5jh0DzLJZs8t+8d0twIu/Rbbo
 F2RCLFH0SyGp8WD/O83ulomlWSTdeuUIbkDn1KxjogRyCGa+bPK42XlN53N6PkyQZyQK92mBc09
 EgHwBByqDFMrLFS/cgLeHbvRp84htOOlMTeztfR8o2TlaCQcOgV5xc7VXcoRp6l0xUVk0x2pWwE
 xZKX2U6Lfa9zreopc0z/HIva9mlvHWWzr3dgOmUN/7LQSLzOonWwfPhT08De7wGSXNPG+UkIyKW
 SZLHlDqcF/DtWnwp2IUbYHx9SG9ZU+/Jaqx517wqcB6l5xLEqu2hUl1CSkYjrjtXjAQfxSMnSXK
 lq6JhO0zY66r93m165VwOSOVxdtPFTMiaFr1SGBvyKxvReFi2r19OotOw/37HUw11K//83UGgul
 xzQTM+ZNlEtnpHw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c13e57 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=AGkLNbZTeN-MX8W9OO4A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xPX5GI6s3zOw-5KSXYm9f2B8W9DQsPhF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfX9nXureX2ijjt
 e3FuOOMl5PVRa0HDDNKcQ5b9Wd3sRwJWKQdDSgwY2VZ8yHNV9OTDKaUyOXriCvZmP7lmeSjhCva
 ICkU6iRZUBqaXqvVru3HNPY7vNNR30Ebvi6w7uWl6/HlgGoFiLrjhMyc+oMh59b8SodommWih7Z
 B92M14kWn7i/VB3WHdinBvXO/N4l4PbsLMqPAnLGdJWLjC34F50JwWiWZ+Ur4ycJbbmKFnPACd4
 X8JNRvog7fh81W/vMT0TRfhYc10+/pm19i7L6vTi5+mpIYaxzqVle2gF6bG+SKxTQdVe4l42cM2
 ncw/zQQ0OYIIUdWLYbdEnOEzSY0NnDZAGx+K16kZVJF+9CyMdvOlg/RBXO46AnH2d4LQezPhE5K
 C/olrnblW6a+b/0xhz606CoBdPzPd/noBjJn8DFLQZnPX8OZQIBDq0beX7VRtIh2dmE9cPTt4nu
 aHtu39O9LCyAhH5GJZA==
X-Proofpoint-GUID: xPX5GI6s3zOw-5KSXYm9f2B8W9DQsPhF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230103
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 brgl@kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v10 2/6] net: stmmac: qcom-ethqos:
 use generic device properties
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:
 linux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:email,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 4924C2F2C3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index d3a6ab7383fc1e1b2e4b12c670b12a8ad1606e6c..4148805a82b106471a25f9496b60be5bb9ce5c00 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -135,7 +135,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 3ccf20fdf52a8ec4649b43ade8ee7b85d613e1c5..66fd2ed2c2c8428694c07d89220d0e1608546791 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -728,7 +728,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -778,7 +777,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
 				     "Failed to map rgmii resource\n");
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->rgmii_por = data->rgmii_por;
 	ethqos->num_rgmii_por = data->num_rgmii_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -818,9 +817,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = true;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
