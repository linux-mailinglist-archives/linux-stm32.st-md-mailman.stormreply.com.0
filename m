Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJBsL2Q+wWlaRwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 14:21:40 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5052F2C77
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 14:21:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A8DDC35E3C;
	Mon, 23 Mar 2026 13:21:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E4C0C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 13:21:38 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62N7tUrh1627059
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 23 Mar 2026 13:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=; b=N7T6It8nbsDjVway
 9BaZbbouLTiam7yJxUITofAZlsTOVZ9Uonfn7oqHXjXD70WrIyNaCPW1Rtph2gir
 o96a5zTDERM23kBtl0XofxJBEr/VQ54r6TS+MzShIQmAfX/OeJj7GXjqMEK3Sh0M
 nkiHvPDXvFyPyysqKWmIGbDpPfRRC/VeyUvxf86mcKZ1aziJSXdOmlazQNQZdmLD
 IHkSHwRwB25W6q/iLKlgpEUsuaMSW6fQELS1dZ0iB8f9Ni2BdEIgZY+iVdq9BDBi
 5a5lDTrA3wOQfaFe/e59Hnptt9CqeoNVspDsgl++i1ZDj+R95UkgxCpu5FLjZSjB
 SM/ZcA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc15ds-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 13:21:36 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-95112a578c3so3261124241.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 06:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774272096; x=1774876896;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=;
 b=E84ltxc5teQHSqYFIWQyEQIiGQf6wT65lBGm1MOXZDSC4cxTtTsmlOG5SrxtydZqal
 4xND9Bx8rKYeWXUPFRYqMkoWwGsVv5PKxJKYJe18EeaCBfm3gbdoMMa8k9T695/D3DEZ
 cIvfEeebWxrvzWLVVM7ihGyh/JVEbGVSm32pif/xorp8OgmG715H1rbSq5ztMCD74ut3
 Sw14CXefmvbuhdUZy5ZXzBDES54FPZRxIYzIg7+LXhNAr03B61wwIf8TPnpK+OSwbuHr
 y5FIWHvDi/wsHMtL4opbtvzBqynhV2Z4NGpHkOPGU6E6H9O4WuooGQHP/pViR0HeN4Ds
 ewlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774272096; x=1774876896;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=;
 b=flXgg7bMVeiBKAkNlb46CKv6ODhmohCEprWJ+eoKBPsPQrp5E0ghqsCu6ymzVQPkUF
 HoJvy7i3WZo4VUl6CZOd7SeQY8Zee+1we0m2Zt3sxZ5xnZgb7DT+6tdz54ks75dokyBt
 s1Zvp7GKtObvR14ChJHtYuDM8cYnrwReGD8h3f04uD2mKKvyBkUbjJUsBuQKhdm8z4tj
 JQNOIUzM/lr6/xXnXheJ1l9Fgm90CJnTgas5Bjweg8ZD97myndFPeNIowa1Uf5mmFVc5
 HhzNxNow1bD0IztfGCZ4FBeEXdwmpzqy1s+T6BkM4JUXtom8Cu6f/3UN5tCL0jqfJXet
 5VTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4fQA0qA+HE0KnNC9u1+D0p78slJJE0SfZxhjm+PXlj1vD41/uewt6M94CKlJr9vpohyAxHFhSFYyVJw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzan+tHYwziOP75NxS97S4PS8pXEe7ZLxgUskp2Iwj05nN59Zmr
 0ffxjHK/vsKTTFR3gxd8riv03lMjoBYzfQQgD2k8c/VOpRYD+23QgbIDSLiAu3TgyWvSWPKRwWR
 qfL6izpoTQJpNwm5RLkzLFeMw2vy8Y3o9uQuGWM910XrBmslCjGa0bU5ICQ+/GnN9lC0GpY3sU0
 1jGBasEPE=
X-Gm-Gg: ATEYQzxwbYCRyFOZZyN6lMRgP9Vkg/ZrUlKkEGJCWJbgM0xehl0KkLTzVHTmkMIy8ZZ
 rjGQHfkvC0coXTpD9oqoOfqMrVUKp22KrHDo6SGxXwb54wp0xW4FrduqqDG1QA5t64Wf/24UqgZ
 1lMsfZLzSacOnYmk50GajJXb2T3Eq64UQ3QTkfIxc38XT2T2H921tp+j2LpECC6iQrn/dJeRX5T
 jiMbC+6vFQEAcosUFrBJKOzEW/WujaI/KmiX2/8qKz2orLnCKU2Hp/+V8H8BNw60YzbOnXMm2EA
 ZrNsj59bX118dTbUMfXYrhSkgIDY0op1w6l9ewPkVgpcBAbwi7OXZZPA1+4t+x1Nj075t9836TK
 Sq28YzcHRCOrLpj1/BdF3wnCMeVzhkkG0GXgTPs4EMvQSOhAVCYvJ
X-Received: by 2002:a05:6102:54a0:b0:602:8894:b779 with SMTP id
 ada2fe7eead31-602aeb097e7mr4875611137.14.1774272095982; 
 Mon, 23 Mar 2026 06:21:35 -0700 (PDT)
X-Received: by 2002:a05:6102:54a0:b0:602:8894:b779 with SMTP id
 ada2fe7eead31-602aeb097e7mr4875596137.14.1774272095387; 
 Mon, 23 Mar 2026 06:21:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 06:21:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:20:57 +0100
MIME-Version: 1.0
Message-Id: <20260323-qcom-sa8255p-emac-v10-5-79302b238a16@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4863;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FNVr79Fi6sLZ+qldLv+chKiF5qjCh0lSqoNC0bsdcWI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5Kco3rCH1VoOXFDR6Bta8LK7OVpeQox5VMf
 wZ4Jyd66j6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+SgAKCRAFnS7L/zaE
 w6WiD/43aaKifrVrtm996QHxWlyMyw5s93jMLKJudGiTSczX3O/TIKMXj794jsC0Pc4OBGPTqss
 Z0mROAxzMuBD37BojXp/vcgcGqNZg0C3TnWxCKWAD0K2SDDd9447LEJHMLcaGzGwfGnKplt0qbm
 rCu3cocM6WNQgCmHWphIBCmzdOCMkZ5pct7oC6hZab0GVwMyhgyhsySKKWvWYFbygWpbGAMZSDQ
 ThxdhrIA7NdGkT7ThmW42HafLfeF6UXMDVRtggBL0D1cvBx1ClnCmo1lxH1ADl+Xp0Fk+7SAnj8
 lwjEkCvhzKK7jkAqCH0KgccSCsJqZahhtsC0eF0iKElRDXmmKGwo6tur0en5yINcOaY4I3kv+Uk
 fjtiuJIeE6m0P/6OvTXroZK8880eODd8OGjhaHBGSIm/yyS4jzb8OyP0xNsOU+htF0R7OZlgDM1
 4b7y6O6RTgnyj078Siyr9DcyI5f34Lx7/MRkdKMbkGtMOr6JYo2fshp2DloitMISvkm/nQDfqSe
 auEeVmwORvOUbUdefPJR2mDibC+whHC9nxZT6cTrz/1eqhdFP5xKjPFBO9wKGaPbNOZmUXWIxno
 Re35XT5k6K2sPqmE1pKF4aO0C4casqDsVItnRxIp+UMKfESDbaj4Orb16Zc6J1TATb0CUihwqAG
 AWkCcpWGVud+Wcg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c13e60 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=TTAMOEIJuQy2Ho-tp7YA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rR2AZrHWOtWNsNebTmIVPugNedNQOFJQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfX087W1U6Zamhe
 PPiRx1HhFJOsbEt7+UtvwlRjX6YxyJ0KNCasCJro7PeDw+bg/JEQqrTIaFfg8GJZUqAIjbkLbWs
 nxcD+NaCnetzNqQWOrdJwoblSVHX8ru7My9WDusAf084GwnSfTgELP4nP/PGSwEBqRew4kPH9YO
 CcWkg1Qo/JB7xl9DKzEn28B+4FqDCWU3RzS6ZvFivmD7nt4rRybQjZVGAzeL+paUKayZqTkTswf
 bJH59GrNG7Sr4G9ZzVyqY0EoamiNDn0btIZY7g40hi3Yi25nmXVpn0dRGUGRwtKWZwpv1NlipO6
 g7ohxn/al9D5ZCEWhiR0RCi92E2RPS0lZkjGT+g4Azgpx49QCFf5aoO61vMw/ccTsu6KpP6/IeS
 I8ZFEIGR7KXNi23q49CxP4LFNxeqVd9GCkvAJoQXY7xaEZyAD/z3DxBeDTX1j233DBWGcP4S0uE
 HARsRBrnJ2uayzA1bKg==
X-Proofpoint-ORIG-GUID: rR2AZrHWOtWNsNebTmIVPugNedNQOFJQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230103
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 brgl@kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v10 5/6] net: stmmac: qcom-ethqos:
 split power management context into a separate struct
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
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,stormreply.com:email,stormreply.com:url,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 9E5052F2C77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 40 ++++++++++++----------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index cbfae18773c1193cd640f07824f5a66d68f9634b..f32ff0d9ce513d8270c8db9c549a79778549df59 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,14 +105,18 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void (*configure_func)(struct qcom_ethqos *ethqos,
 			       phy_interface_t interface, int speed);
 
-	struct clk *link_clk;
-	struct phy *serdes_phy;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *rgmii_por;
@@ -194,7 +198,7 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	return clk_set_rate(ethqos->pm.link_clk, rate * 2);
 }
 
 static void
@@ -670,13 +674,13 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		phy_exit(ethqos->pm.serdes_phy);
 
 	return ret;
 }
@@ -685,8 +689,8 @@ static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
@@ -700,7 +704,7 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 
 	if (interface == PHY_INTERFACE_MODE_SGMII ||
 	    interface == PHY_INTERFACE_MODE_2500BASEX)
-		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+		ret = phy_set_mode_ext(ethqos->pm.serdes_phy, PHY_MODE_ETHERNET,
 				       interface);
 
 	return ret;
@@ -712,7 +716,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -726,7 +730,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -819,9 +823,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+	if (IS_ERR(ethqos->pm.link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
 				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
@@ -832,9 +836,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
@@ -859,7 +863,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
+	if (ethqos->pm.serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
