Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TJg3KGrmVGoZgwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 15:21:46 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4000D74B803
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 15:21:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=dAqZS2MR;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=TKeYY66t;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B83EC8F274;
	Mon, 13 Jul 2026 13:21:46 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97F55CA8E4B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 13:21:44 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DCE2Xd1428547
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 13 Jul 2026 13:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +2ZprCy+bUYfEEV2sLvW6R099FI4HZnlU8Ix92wRw7k=; b=dAqZS2MRgD9bQjzE
 7fkd7SLmmebZa0KqKh/N419BADvAkALOln4bbxCm4KlpyE9E9QtRJuK2DFjSEgFx
 MoZMUJYgGg6PkkW++3WtZDUzBFlTu4Yb7p4YxQEi5BKwEc0bbr9JA1X1EOGn7Mke
 GUgse6seFhGYIZzv8v9tIYd5hAAcQYFFnmPQU5LeLJI0VddrDbrsJdIczg12onFv
 MDUVprMl7mGSFdYXpRHBd08sYrxfj915Gq4mQ/gAT7wONX5mraB/CJI3DFwc1CZe
 9dUGXitF9erhRkx7HJGDb+P5ajq/3RUmi4bI/q/TsigdZTg9ZOWAAtsykPEGy+m7
 12vQow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn18ek-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 13:21:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51bf321d786so37736011cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 06:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783948903; x=1784553703;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+2ZprCy+bUYfEEV2sLvW6R099FI4HZnlU8Ix92wRw7k=;
 b=TKeYY66tgauzCrex3V0u9G2dax84t+n/mf+jhSVbLEk3Dd6B9+Ae9OUj9C5GLMrXfu
 1MH02WNcSUqdmKYmVP6zteSX5rNmJD6WmHiSmBz6yShjlHgpHTYHyUNZ/iVbjQjk2VAd
 eQe/y6Mb3agZE56JbVYwg+6FKKH8KxzT+kROIVo4czWz59dKIpBhg35Jy0W3SVFcF6yG
 75MXf8aW14FRxMOny6MwIhqd4oH6PQsH0PXS60dXnNVjzeDjaKMupgkbUxPIcAt/dwii
 BMyZMvW+JFZemUghyq/wD8xlpI0k8GPKtRU8eR237viUhpLYMGnFmCNfUXH7htH71Z7i
 1v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783948903; x=1784553703;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+2ZprCy+bUYfEEV2sLvW6R099FI4HZnlU8Ix92wRw7k=;
 b=pomFr4mZIWt0iozj/R8jfkYys1GKH6pwYXaZMLtDiDMzTd4VFbWhEiUzIiEuEJVNZt
 WNA81qaRklDmqbvgI9nSeh7RUHtweEJGgn0YdxQghzNHKYyym2WBF7Pr7nCeBw5oSEkc
 1GkP67Cq0YSo9OHjQaQjtva1JFr3sMBvVQMvufHyCeuc+5E7dxNZN194mTcP/lULwuIA
 TdqjtPbQGz3/IMg34fMimRRjobPYvWDg67DqaqCyTor2HWEQUIDuchVXmoEPVerkvOlu
 nawnW0b9Q8DE1SKmHlrY1g7PubovrLjnJPqt/OrVlKrBLxlnGX8NdpWglebSt0bU6UWP
 l78Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqr+/ZUvBLmJYXl/+SDDiYD9t7hjPU3NpCVEeeEYry5cvYsoRSXPHrEul+TbNxGXqnV+sFPm2hmx9mIsA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YysCqhEELwkExaV+LXKfXmPDmN6NoV5I3U0kvXGbzcPSQl1BCr+
 rlFAu1d6+L8P5tGEqAIgRF4L5+Ix1SQQ9tCFkfP6CD8/uPJefZwJg6+Qsw2Eqn3v85FsJ5Z3qkA
 1HcEBLs+JMq6hKghbDQ5Y7074vTt4d93LuF8nNfYRDKGDPCoU7n4GBh4HXs+/An/MN73vJn546l
 JCKDPWvUg=
X-Gm-Gg: AfdE7clfnkotx/kP7eEN4OtbWaxw1DccgifV+0YxKeaYcc3GQxAZeYPZLubsbb7LENh
 lUcnXcWu9DAk7a9D4iQgESBk4IEw5XXCgRupUiZYLYuUVMjQkUUPDMC6ypk02i4juXEeR9mi5yQ
 L9X6vpUwV81qan53z5rTOibwcRENUPHRofwKqY1W9KndaTF6j0BX2yy1wZE8FRCvwH3VIhMdMh0
 vHu4bu9jcWgYuAJLLfBx0Fm72oNlewuGdzZ7jPSe4BsZo6qAzqTB5BJieqvZH0hva+mxEUFGFu0
 4mAEw//omu7IUn3ye79PTccUnYcEnCQRnezSp2/7pMajWJ1LOiqBQWaGwUu5PVdJI3yKnEpZ8SC
 0BqAlx0c9W4BJ/HRKhoyWG2YdpWwgQBBNr8SNRlVZ
X-Received: by 2002:ac8:7fcd:0:b0:51c:1b78:b044 with SMTP id
 d75a77b69052e-51cbf27e714mr91207731cf.61.1783948902458; 
 Mon, 13 Jul 2026 06:21:42 -0700 (PDT)
X-Received: by 2002:ac8:7fcd:0:b0:51c:1b78:b044 with SMTP id
 d75a77b69052e-51cbf27e714mr91207081cf.61.1783948901957; 
 Mon, 13 Jul 2026 06:21:41 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 06:21:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:39 +0200
MIME-Version: 1.0
Message-Id: <20260713-qcom-sa8255p-emac-v13-10-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
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
 Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5660;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TqGGHsUwyhTsco06VxVuKgwFcBldf6bN3oZwc4gBkFI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY9WSl89yzJ2CqMhlNNU32SUrhE3oOrdIQ8i
 NwsReN/KxyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmPQAKCRAFnS7L/zaE
 w3nCEAC1q3NEe6qIb2fTolQ4Z9crn1CgZI+xbic7vhmRZAUVv2Y+TlD1w+G8QI+LY1Q2jCtPvHE
 APl58knmDufMR0I2L7Kjq+b0xL6+z/8+9cW1te2Nv9Mub5tO7TOQ4bS0siuIDg9h75hoYRhmTYT
 VG2pDnADdTWmYlJadmBqZQesz3LU/8wgeP/MCx7WMuUoxL7dr/vdGjhke74AypqVAmWBQqyE7zb
 9LhGB8JQuhU2axn4XHHVaUB/XvWBDoRWRF6QwJ66eoUBPPOgGvhp/0OdDigx1Nv3aMf6mfloKsg
 U8iOqKIb2FPUGDTv0vE5myMB84jwjXFg3ux3UkSejFAe0xik3eT9GYgUHPm1DUgkBPqm9aUBGsx
 zLMVZu7dEVweNIBa2BXOOb9v586Mk6rSYrH+t//kxMyl5dv6n2mnScucHHH6fAw+RxoE1NTawCU
 QrOT1N6vB1LUWwolnHaVH7lXf496fbGZnfkb49q0UW0GzEgSzSs9t/gl0oFMQx2yhgXX1u+Q8Af
 82h70nfjk9yU0b+AqzlPEyHcp7YK8Tj4dCs5YgHPDAFdlTumFOnbQxweaxv1hOBXVOhp0CC/rbk
 YrqsYusTK0WT9c/Ecb7BzFoI95ZNE7eaddEsJBBtJmPJAC7mO+h6atdhgwE5FnPbFDoNb24il+N
 9Y4jV9pjO+YFPVw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 9_c6-aUblb66wdUN6OWCIx2SHBtiAt6T
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54e667 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2F0B3szvjGg3gJiy4BkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX1ipJzzF5CoWR
 WP+GismRcFWqu5NBe6bDJhueXWme8x2lt8Q5MvFQNZ2ptMnQoguxrRvy+f/Kh4TTjkWmHAey0Wg
 13uqfCHmp+5nfexcSM35l15QrLpRSe0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX4YEqesyQN8wA
 iVhNUPdZOzbwn3/EH0YdsHQSAaKt4lYtOMg5F7+JTWHqA2raQeioXIU+8rFAaZr3Wk4C51Qw7Uc
 KudVSc0siPo5UMO/793aZEMT7jDGysRya2ZwIECB8tbcZ8JsWVshWxlAu5EDqfp910684D6PwSu
 7O57OD5N3Am+qlhhzh0PQVLbdRWbCjC6aEyU5dbg3dbH2sE5ULiKPWMxIWQHbuvqP43fz6+a+ct
 oe7Q+sXMh2e3CHPgBbxDyP8tXwcrv71k85jXz8UsvvS70ijgVm6hvRnjX+40AXV5KkeF4vqGG9g
 5mtwq750h1VT+kACXh6SRaLgbm5ieZR6A/rQAf6o/a0R/Fuh8f4BdBjFUZgXldo6Xr0aHBqEitb
 +sTl4F+QGFxaxXDk/p0z5stBbB1+XtFXIE6E9qSWpw4yv9f7qGtdQ4CJn2Ljjc9y0LirluifLwn
 Yj8WY0inROvKEebEznQ==
X-Proofpoint-GUID: 9_c6-aUblb66wdUN6OWCIx2SHBtiAt6T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 brgl@kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v13 10/10] net: stmmac: qcom-ethqos:
 add support for sa8255p
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
X-Rspamd-Action: no action
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
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:radu@rendec.net,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:lin
 ux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,rendec.net];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4000D74B803

Extend the driver to support a new model - sa8255p. Unlike the previously
supported variants, this one's power management is done in the firmware
over SCMI. This is modeled in linux using power domains so add a new
emac data variant and a separate setup callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 3af1608fc21cc7cf6b0ad31952b9f59d6f00a2b1..d34f20f868138c4e81ce85364cc97d47c445238f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -98,6 +98,11 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	/* Fixed PTP reference clock rate, used on SCMI platforms where
+	 * firmware does not implement the clock protocol allowing linux to
+	 * query it.
+	 */
+	unsigned long ptp_clk_rate;
 	int (*setup)(struct qcom_ethqos *ethqos,
 		     struct plat_stmmacenet_data *plat_dat);
 };
@@ -108,6 +113,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
+	struct dev_pm_domain_list *pds;
 	const struct ethqos_emac_driver_data *data;
 };
 
@@ -207,6 +213,8 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 
 static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 			     struct plat_stmmacenet_data *plat_dat);
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
 
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
@@ -311,6 +319,30 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
+	.has_emac_ge_3 = true,
+	.needs_sgmii_loopback = true,
+	.dma_addr_width = 36,
+	.ptp_clk_rate = 230400000,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+	.setup = ethqos_scmi_setup,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -756,6 +788,63 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	return 0;
 }
 
+static const char *const ethqos_scmi_pd_names[] = { "core", "mdio" };
+
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	const struct dev_pm_domain_attach_data pd_data = {
+		.pd_names	= ethqos_scmi_pd_names,
+		.num_pd_names	= ARRAY_SIZE(ethqos_scmi_pd_names),
+		.pd_flags	= PD_FLAG_DEV_LINK_ON,
+	};
+
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &ethqos->pds);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to attach power domains\n");
+
+	/*
+	 * The SerDes lane, its clocks and the MAC AXI/AHB clocks are owned by
+	 * firmware and brought up through the SCMI power domains above. The
+	 * MAC wrapper itself, however is in the kernel's register space: the
+	 * mux that feeds the SerDes recovered RX clock into the MAC's clk_rx_i
+	 * is not configured by firmware. Without it, clk_rx_i never toggles
+	 * and the DMA SW-reset polled in dwmac4_dma_reset() never completes.
+	 *
+	 * Map the wrapper and program the same loopback/functional clock bits
+	 * the non-firmware platforms rely on (see ethqos_clks_config) so the
+	 * RX clock is present by the time the DMA engine is reset.
+	 */
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	/*
+	 * Run on every runtime resume, which stmmac performs after the power
+	 * domains are on but before serdes_powerup() and the DMA reset, so the
+	 * wrapper is always configured ahead of the reset.
+	 */
+	plat_dat->clks_config = ethqos_clks_config;
+	plat_dat->clk_ptp_rate = ethqos->data->ptp_clk_rate;
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -843,6 +932,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
